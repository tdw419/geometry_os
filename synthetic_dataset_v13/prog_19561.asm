; DESCRIPTION: Places a red dot at position (185, 61).
; PLAN: r0=185(x), r1=61(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 185
LDI r1, 61
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
