; DESCRIPTION: Sets a single purple pixel at (412, 23).
; PLAN: r0=412(x), r1=23(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 412
LDI r1, 23
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
