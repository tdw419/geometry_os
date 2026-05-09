; DESCRIPTION: Places a blue dot at position (167, 175).
; PLAN: r0=167(x), r1=175(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 167
LDI r1, 175
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
