; DESCRIPTION: Renders a yellow box of size 18x110 starting at (136, 2).
; PLAN: r0=136(x), r1=2(y), r2=18(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 2
LDI r2, 18
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
