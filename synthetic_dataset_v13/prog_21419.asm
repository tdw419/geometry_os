; DESCRIPTION: Places a purple dot at position (273, 19).
; PLAN: r0=273(x), r1=19(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 273
LDI r1, 19
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
