; DESCRIPTION: Places a blue dot at position (269, 102).
; PLAN: r0=269(x), r1=102(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 269
LDI r1, 102
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
