; DESCRIPTION: Places a purple dot at position (329, 105).
; PLAN: r0=329(x), r1=105(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 329
LDI r1, 105
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
