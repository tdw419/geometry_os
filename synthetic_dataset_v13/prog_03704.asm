; DESCRIPTION: Places a purple dot at position (23, 116).
; PLAN: r0=23(x), r1=116(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 23
LDI r1, 116
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
