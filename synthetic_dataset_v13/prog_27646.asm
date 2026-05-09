; DESCRIPTION: Renders a magenta box of size 39x54 starting at (97, 31).
; PLAN: r0=97(x), r1=31(y), r2=39(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 31
LDI r2, 39
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
