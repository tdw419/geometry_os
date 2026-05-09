; DESCRIPTION: Places a yellow dot at position (378, 12).
; PLAN: r0=378(x), r1=12(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 378
LDI r1, 12
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
