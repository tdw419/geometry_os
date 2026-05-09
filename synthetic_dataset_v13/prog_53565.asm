; DESCRIPTION: Places a blue dot at position (504, 157).
; PLAN: r0=504(x), r1=157(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 504
LDI r1, 157
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
