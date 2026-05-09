; DESCRIPTION: Places a purple dot at position (141, 94).
; PLAN: r0=141(x), r1=94(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 141
LDI r1, 94
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
