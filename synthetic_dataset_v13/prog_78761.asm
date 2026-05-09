; DESCRIPTION: Places a purple dot at position (205, 199).
; PLAN: r0=205(x), r1=199(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 205
LDI r1, 199
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
