; DESCRIPTION: Sets a single blue pixel at (197, 98).
; PLAN: r0=197(x), r1=98(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 197
LDI r1, 98
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
