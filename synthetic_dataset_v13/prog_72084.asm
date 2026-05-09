; DESCRIPTION: Sets a single blue pixel at (16, 174).
; PLAN: r0=16(x), r1=174(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 16
LDI r1, 174
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
