; DESCRIPTION: Creates a red circular shape at (132, 193) with radius 51.
; PLAN: r0=132(x), r1=193(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 193
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
