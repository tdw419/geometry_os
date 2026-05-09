; DESCRIPTION: Places a black dot at position (247, 204).
; PLAN: r0=247(x), r1=204(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 247
LDI r1, 204
LDI r2, 0x000000
PSET r0, r1, r2
HALT
