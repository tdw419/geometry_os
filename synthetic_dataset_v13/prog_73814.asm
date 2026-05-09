; DESCRIPTION: Renders a blue box of size 55x110 starting at (270, 78).
; PLAN: r0=270(x), r1=78(y), r2=55(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 78
LDI r2, 55
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
