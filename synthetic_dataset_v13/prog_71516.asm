; DESCRIPTION: Places a purple dot at position (193, 233).
; PLAN: r0=193(x), r1=233(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 193
LDI r1, 233
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
