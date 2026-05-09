; DESCRIPTION: Places a red dot at position (233, 199).
; PLAN: r0=233(x), r1=199(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 233
LDI r1, 199
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
