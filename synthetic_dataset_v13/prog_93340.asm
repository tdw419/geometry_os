; DESCRIPTION: Sets a single black pixel at (80, 116).
; PLAN: r0=80(x), r1=116(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 80
LDI r1, 116
LDI r2, 0x000000
PSET r0, r1, r2
HALT
