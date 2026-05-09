; DESCRIPTION: Sets a single blue pixel at (61, 113).
; PLAN: r0=61(x), r1=113(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 61
LDI r1, 113
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
