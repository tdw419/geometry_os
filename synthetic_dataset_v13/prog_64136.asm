; DESCRIPTION: Places a blue dot at position (402, 172).
; PLAN: r0=402(x), r1=172(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 402
LDI r1, 172
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
