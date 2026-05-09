; DESCRIPTION: Sets a single blue pixel at (255, 68).
; PLAN: r0=255(x), r1=68(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 255
LDI r1, 68
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
