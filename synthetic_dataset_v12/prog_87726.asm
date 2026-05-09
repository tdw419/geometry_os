; DESCRIPTION: Places a blue dot at position (494, 70).
; PLAN: r0=494(x), r1=70(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 494
LDI r1, 70
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
