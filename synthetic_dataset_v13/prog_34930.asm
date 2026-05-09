; DESCRIPTION: Places a black dot at position (266, 204).
; PLAN: r0=266(x), r1=204(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 266
LDI r1, 204
LDI r2, 0x000000
PSET r0, r1, r2
HALT
