; DESCRIPTION: Places a blue dot at position (153, 124).
; PLAN: r0=153(x), r1=124(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 153
LDI r1, 124
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
