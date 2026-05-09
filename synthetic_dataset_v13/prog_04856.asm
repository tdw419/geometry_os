; DESCRIPTION: Sets a single blue pixel at (410, 137).
; PLAN: r0=410(x), r1=137(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 410
LDI r1, 137
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
