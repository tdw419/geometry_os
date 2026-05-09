; DESCRIPTION: Renders a yellow box of size 45x114 starting at (355, 18).
; PLAN: r0=355(x), r1=18(y), r2=45(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 18
LDI r2, 45
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
