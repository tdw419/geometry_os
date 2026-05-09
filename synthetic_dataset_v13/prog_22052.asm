; DESCRIPTION: Renders a yellow box of size 81x13 starting at (51, 109).
; PLAN: r0=51(x), r1=109(y), r2=81(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 109
LDI r2, 81
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
