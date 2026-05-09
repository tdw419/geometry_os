; DESCRIPTION: Places a purple dot at position (365, 205).
; PLAN: r0=365(x), r1=205(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 365
LDI r1, 205
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
