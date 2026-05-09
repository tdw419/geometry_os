; DESCRIPTION: Places a yellow dot at position (441, 250).
; PLAN: r0=441(x), r1=250(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 441
LDI r1, 250
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
