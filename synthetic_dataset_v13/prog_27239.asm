; DESCRIPTION: Sets a single black pixel at (460, 87).
; PLAN: r0=460(x), r1=87(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 460
LDI r1, 87
LDI r2, 0x000000
PSET r0, r1, r2
HALT
