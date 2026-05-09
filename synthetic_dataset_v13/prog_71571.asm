; DESCRIPTION: Sets a single black pixel at (460, 250).
; PLAN: r0=460(x), r1=250(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 460
LDI r1, 250
LDI r2, 0x000000
PSET r0, r1, r2
HALT
