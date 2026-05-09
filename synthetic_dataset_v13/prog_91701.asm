; DESCRIPTION: Places a blue dot at position (40, 214).
; PLAN: r0=40(x), r1=214(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 40
LDI r1, 214
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
