; DESCRIPTION: Sets a single purple pixel at (473, 70).
; PLAN: r0=473(x), r1=70(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 473
LDI r1, 70
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
