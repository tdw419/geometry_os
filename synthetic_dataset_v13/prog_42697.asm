; DESCRIPTION: Places a purple dot at position (190, 197).
; PLAN: r0=190(x), r1=197(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 190
LDI r1, 197
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
