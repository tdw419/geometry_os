; DESCRIPTION: Places a blue dot at position (360, 66).
; PLAN: r0=360(x), r1=66(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 360
LDI r1, 66
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
