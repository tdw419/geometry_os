; DESCRIPTION: Sets a single purple pixel at (214, 16).
; PLAN: r0=214(x), r1=16(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 214
LDI r1, 16
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
