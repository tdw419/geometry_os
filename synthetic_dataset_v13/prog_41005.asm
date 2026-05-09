; DESCRIPTION: Sets a single purple pixel at (135, 121).
; PLAN: r0=135(x), r1=121(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 135
LDI r1, 121
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
