; DESCRIPTION: Renders a yellow box of size 58x54 starting at (432, 105).
; PLAN: r0=432(x), r1=105(y), r2=58(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 105
LDI r2, 58
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
