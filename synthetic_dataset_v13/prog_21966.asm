; DESCRIPTION: Renders a blue box of size 110x13 starting at (186, 20).
; PLAN: r0=186(x), r1=20(y), r2=110(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 20
LDI r2, 110
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
