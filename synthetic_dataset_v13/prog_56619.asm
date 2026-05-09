; DESCRIPTION: Places a purple dot at position (427, 197).
; PLAN: r0=427(x), r1=197(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 427
LDI r1, 197
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
