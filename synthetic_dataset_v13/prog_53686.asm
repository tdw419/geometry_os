; DESCRIPTION: Places a blue dot at position (117, 2).
; PLAN: r0=117(x), r1=2(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 117
LDI r1, 2
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
