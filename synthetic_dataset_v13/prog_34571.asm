; DESCRIPTION: Places a blue dot at position (483, 158).
; PLAN: r0=483(x), r1=158(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 483
LDI r1, 158
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
