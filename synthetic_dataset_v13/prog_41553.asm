; DESCRIPTION: Places a red dot at position (141, 7).
; PLAN: r0=141(x), r1=7(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 141
LDI r1, 7
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
