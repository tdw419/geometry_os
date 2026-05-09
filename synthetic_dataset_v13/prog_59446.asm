; DESCRIPTION: Places a yellow dot at position (391, 0).
; PLAN: r0=391(x), r1=0(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 391
LDI r1, 0
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
