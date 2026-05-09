; DESCRIPTION: Places a black dot at position (365, 127).
; PLAN: r0=365(x), r1=127(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 365
LDI r1, 127
LDI r2, 0x000000
PSET r0, r1, r2
HALT
