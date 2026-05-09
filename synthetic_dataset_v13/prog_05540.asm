; DESCRIPTION: Renders a yellow box of size 45x51 starting at (176, 99).
; PLAN: r0=176(x), r1=99(y), r2=45(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 99
LDI r2, 45
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
