; DESCRIPTION: Renders a blue box of size 95x110 starting at (19, 70).
; PLAN: r0=19(x), r1=70(y), r2=95(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 70
LDI r2, 95
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
