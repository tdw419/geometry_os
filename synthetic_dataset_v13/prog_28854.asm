; DESCRIPTION: Sets a single purple pixel at (504, 213).
; PLAN: r0=504(x), r1=213(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 504
LDI r1, 213
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
