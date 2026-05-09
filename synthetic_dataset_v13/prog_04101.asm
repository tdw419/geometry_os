; DESCRIPTION: Sets a single black pixel at (48, 10).
; PLAN: r0=48(x), r1=10(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 48
LDI r1, 10
LDI r2, 0x000000
PSET r0, r1, r2
HALT
