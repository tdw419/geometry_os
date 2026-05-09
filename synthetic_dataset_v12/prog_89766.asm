; DESCRIPTION: Renders a yellow box of size 52x62 starting at (55, 147).
; PLAN: r0=55(x), r1=147(y), r2=52(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 147
LDI r2, 52
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
