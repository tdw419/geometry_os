; DESCRIPTION: Sets a single blue pixel at (118, 228).
; PLAN: r0=118(x), r1=228(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 118
LDI r1, 228
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
