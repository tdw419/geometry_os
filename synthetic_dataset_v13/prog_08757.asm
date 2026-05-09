; DESCRIPTION: Places a red dot at position (441, 132).
; PLAN: r0=441(x), r1=132(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 441
LDI r1, 132
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
