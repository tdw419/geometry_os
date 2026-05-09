; DESCRIPTION: Places a blue dot at position (63, 217).
; PLAN: r0=63(x), r1=217(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 63
LDI r1, 217
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
