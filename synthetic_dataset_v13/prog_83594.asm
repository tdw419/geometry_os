; DESCRIPTION: Places a yellow dot at position (468, 124).
; PLAN: r0=468(x), r1=124(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 468
LDI r1, 124
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
