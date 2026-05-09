; DESCRIPTION: Places a blue dot at position (245, 26).
; PLAN: r0=245(x), r1=26(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 245
LDI r1, 26
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
