; DESCRIPTION: Places a purple dot at position (218, 34).
; PLAN: r0=218(x), r1=34(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 218
LDI r1, 34
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
