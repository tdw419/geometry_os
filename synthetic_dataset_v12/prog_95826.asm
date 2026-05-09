; DESCRIPTION: Renders a yellow box of size 52x118 starting at (432, 22).
; PLAN: r0=432(x), r1=22(y), r2=52(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 22
LDI r2, 52
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
