; DESCRIPTION: Renders a blue box of size 37x96 starting at (402, 80).
; PLAN: r0=402(x), r1=80(y), r2=37(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 80
LDI r2, 37
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
