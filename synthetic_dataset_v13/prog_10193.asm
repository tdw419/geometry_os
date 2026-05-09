; DESCRIPTION: Creates a red circular shape at (178, 149) with radius 51.
; PLAN: r0=178(x), r1=149(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 149
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
