; DESCRIPTION: Places a blue dot at position (140, 225).
; PLAN: r0=140(x), r1=225(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 140
LDI r1, 225
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
