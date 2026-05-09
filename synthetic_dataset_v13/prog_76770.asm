; DESCRIPTION: Places a black dot at position (267, 245).
; PLAN: r0=267(x), r1=245(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 267
LDI r1, 245
LDI r2, 0x000000
PSET r0, r1, r2
HALT
