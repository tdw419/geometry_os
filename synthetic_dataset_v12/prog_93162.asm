; DESCRIPTION: Places a blue dot at position (471, 144).
; PLAN: r0=471(x), r1=144(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 471
LDI r1, 144
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
