; DESCRIPTION: Places a purple dot at position (213, 139).
; PLAN: r0=213(x), r1=139(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 213
LDI r1, 139
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
