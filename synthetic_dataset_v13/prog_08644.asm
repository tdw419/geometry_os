; DESCRIPTION: Places a blue dot at position (430, 166).
; PLAN: r0=430(x), r1=166(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 430
LDI r1, 166
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
