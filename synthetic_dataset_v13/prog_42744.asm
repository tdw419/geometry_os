; DESCRIPTION: Sets a single purple pixel at (95, 212).
; PLAN: r0=95(x), r1=212(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 95
LDI r1, 212
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
