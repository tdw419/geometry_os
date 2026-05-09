; DESCRIPTION: Sets a single blue pixel at (464, 31).
; PLAN: r0=464(x), r1=31(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 464
LDI r1, 31
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
