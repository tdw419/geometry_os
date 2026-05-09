; DESCRIPTION: Places a red dot at position (312, 59).
; PLAN: r0=312(x), r1=59(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 312
LDI r1, 59
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
