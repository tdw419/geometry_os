; DESCRIPTION: Sets a single blue pixel at (301, 254).
; PLAN: r0=301(x), r1=254(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 301
LDI r1, 254
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
