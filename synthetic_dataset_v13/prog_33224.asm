; DESCRIPTION: Places a purple dot at position (301, 64).
; PLAN: r0=301(x), r1=64(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 301
LDI r1, 64
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
