; DESCRIPTION: Sets a single black pixel at (369, 93).
; PLAN: r0=369(x), r1=93(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 369
LDI r1, 93
LDI r2, 0x000000
PSET r0, r1, r2
HALT
