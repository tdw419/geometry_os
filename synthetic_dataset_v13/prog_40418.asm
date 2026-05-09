; DESCRIPTION: Renders a yellow box of size 116x51 starting at (148, 45).
; PLAN: r0=148(x), r1=45(y), r2=116(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 45
LDI r2, 116
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
