; DESCRIPTION: Places a black dot at position (459, 143).
; PLAN: r0=459(x), r1=143(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 459
LDI r1, 143
LDI r2, 0x000000
PSET r0, r1, r2
HALT
