; DESCRIPTION: Places a blue dot at position (453, 57).
; PLAN: r0=453(x), r1=57(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 453
LDI r1, 57
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
