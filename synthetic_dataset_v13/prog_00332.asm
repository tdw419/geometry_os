; DESCRIPTION: Sets a single purple pixel at (38, 192).
; PLAN: r0=38(x), r1=192(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 38
LDI r1, 192
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
