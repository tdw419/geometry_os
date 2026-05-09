; DESCRIPTION: Places a yellow dot at position (407, 119).
; PLAN: r0=407(x), r1=119(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 407
LDI r1, 119
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
