; DESCRIPTION: Places a blue dot at position (126, 45).
; PLAN: r0=126(x), r1=45(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 126
LDI r1, 45
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
