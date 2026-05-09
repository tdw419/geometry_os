; DESCRIPTION: Places a black dot at position (265, 174).
; PLAN: r0=265(x), r1=174(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 265
LDI r1, 174
LDI r2, 0x000000
PSET r0, r1, r2
HALT
