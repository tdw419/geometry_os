; DESCRIPTION: Renders a blue box of size 80x12 starting at (430, 217).
; PLAN: r0=430(x), r1=217(y), r2=80(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 217
LDI r2, 80
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
