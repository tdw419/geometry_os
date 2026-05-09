; DESCRIPTION: Sets a single purple pixel at (503, 152).
; PLAN: r0=503(x), r1=152(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 503
LDI r1, 152
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
