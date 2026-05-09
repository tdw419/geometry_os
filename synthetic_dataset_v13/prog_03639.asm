; DESCRIPTION: Renders a yellow box of size 45x35 starting at (26, 9).
; PLAN: r0=26(x), r1=9(y), r2=45(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 9
LDI r2, 45
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
