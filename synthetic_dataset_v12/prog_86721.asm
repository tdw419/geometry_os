; DESCRIPTION: Sets a single black pixel at (213, 79).
; PLAN: r0=213(x), r1=79(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 213
LDI r1, 79
LDI r2, 0x000000
PSET r0, r1, r2
HALT
