; DESCRIPTION: Renders a magenta box of size 105x65 starting at (176, 16).
; PLAN: r0=176(x), r1=16(y), r2=105(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 16
LDI r2, 105
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
