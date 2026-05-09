; DESCRIPTION: Renders a magenta box of size 65x97 starting at (204, 158).
; PLAN: r0=204(x), r1=158(y), r2=65(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 158
LDI r2, 65
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
