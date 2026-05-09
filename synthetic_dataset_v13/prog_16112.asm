; DESCRIPTION: Places a yellow dot at position (475, 217).
; PLAN: r0=475(x), r1=217(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 475
LDI r1, 217
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
