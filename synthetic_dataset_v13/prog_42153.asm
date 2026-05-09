; DESCRIPTION: Sets a single blue pixel at (444, 113).
; PLAN: r0=444(x), r1=113(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 444
LDI r1, 113
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
