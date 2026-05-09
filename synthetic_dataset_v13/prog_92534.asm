; DESCRIPTION: Renders a blue box of size 17x70 starting at (270, 102).
; PLAN: r0=270(x), r1=102(y), r2=17(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 102
LDI r2, 17
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
