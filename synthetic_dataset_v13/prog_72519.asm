; DESCRIPTION: Places a blue dot at position (418, 137).
; PLAN: r0=418(x), r1=137(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 418
LDI r1, 137
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
