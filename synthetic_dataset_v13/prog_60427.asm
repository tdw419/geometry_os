; DESCRIPTION: Places a purple dot at position (225, 199).
; PLAN: r0=225(x), r1=199(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 225
LDI r1, 199
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
