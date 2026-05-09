; DESCRIPTION: Renders a yellow box of size 51x19 starting at (40, 9).
; PLAN: r0=40(x), r1=9(y), r2=51(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 9
LDI r2, 51
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
