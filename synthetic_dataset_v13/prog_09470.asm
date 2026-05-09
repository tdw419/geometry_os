; DESCRIPTION: Sets a single purple pixel at (55, 152).
; PLAN: r0=55(x), r1=152(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 55
LDI r1, 152
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
