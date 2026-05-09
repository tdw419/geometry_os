; DESCRIPTION: Renders a blue box of size 79x40 starting at (416, 105).
; PLAN: r0=416(x), r1=105(y), r2=79(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 105
LDI r2, 79
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
