; DESCRIPTION: Sets a single purple pixel at (98, 231).
; PLAN: r0=98(x), r1=231(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 98
LDI r1, 231
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
