; DESCRIPTION: Places a yellow dot at position (139, 251).
; PLAN: r0=139(x), r1=251(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 139
LDI r1, 251
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
