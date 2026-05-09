; DESCRIPTION: Places a purple dot at position (461, 213).
; PLAN: r0=461(x), r1=213(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 461
LDI r1, 213
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
