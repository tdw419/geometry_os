; DESCRIPTION: Places a red dot at position (369, 185).
; PLAN: r0=369(x), r1=185(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 369
LDI r1, 185
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
