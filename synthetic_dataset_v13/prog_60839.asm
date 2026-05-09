; DESCRIPTION: Places a yellow dot at position (436, 66).
; PLAN: r0=436(x), r1=66(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 436
LDI r1, 66
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
