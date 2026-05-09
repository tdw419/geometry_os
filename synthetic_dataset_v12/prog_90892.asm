; DESCRIPTION: Renders a yellow box of size 25x30 starting at (430, 110).
; PLAN: r0=430(x), r1=110(y), r2=25(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 110
LDI r2, 25
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
