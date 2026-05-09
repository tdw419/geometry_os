; DESCRIPTION: Sets a single blue pixel at (392, 182).
; PLAN: r0=392(x), r1=182(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 392
LDI r1, 182
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
