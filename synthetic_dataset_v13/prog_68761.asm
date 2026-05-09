; DESCRIPTION: Places a blue dot at position (96, 178).
; PLAN: r0=96(x), r1=178(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 96
LDI r1, 178
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
