; DESCRIPTION: Renders a yellow box of size 100x51 starting at (1, 204).
; PLAN: r0=1(x), r1=204(y), r2=100(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 204
LDI r2, 100
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
