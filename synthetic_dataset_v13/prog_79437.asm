; DESCRIPTION: Sets a single blue pixel at (416, 226).
; PLAN: r0=416(x), r1=226(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 416
LDI r1, 226
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
