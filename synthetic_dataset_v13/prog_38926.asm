; DESCRIPTION: Sets a single blue pixel at (305, 74).
; PLAN: r0=305(x), r1=74(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 305
LDI r1, 74
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
