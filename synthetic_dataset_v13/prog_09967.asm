; DESCRIPTION: Sets a single blue pixel at (440, 213).
; PLAN: r0=440(x), r1=213(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 440
LDI r1, 213
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
