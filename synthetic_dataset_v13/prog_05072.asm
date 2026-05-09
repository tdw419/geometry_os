; DESCRIPTION: Places a blue dot at position (466, 24).
; PLAN: r0=466(x), r1=24(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 466
LDI r1, 24
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
