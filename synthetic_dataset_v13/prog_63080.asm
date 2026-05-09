; DESCRIPTION: Places a black dot at position (233, 247).
; PLAN: r0=233(x), r1=247(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 233
LDI r1, 247
LDI r2, 0x000000
PSET r0, r1, r2
HALT
