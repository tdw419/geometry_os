; DESCRIPTION: Sets a single purple pixel at (465, 197).
; PLAN: r0=465(x), r1=197(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 465
LDI r1, 197
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
