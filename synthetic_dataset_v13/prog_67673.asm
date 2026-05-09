; DESCRIPTION: Sets a single blue pixel at (101, 169).
; PLAN: r0=101(x), r1=169(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 101
LDI r1, 169
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
