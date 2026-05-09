; DESCRIPTION: Places a blue dot at position (338, 251).
; PLAN: r0=338(x), r1=251(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 338
LDI r1, 251
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
