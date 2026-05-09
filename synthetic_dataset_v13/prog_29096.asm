; DESCRIPTION: Renders a yellow box of size 22x41 starting at (222, 181).
; PLAN: r0=222(x), r1=181(y), r2=22(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 181
LDI r2, 22
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
