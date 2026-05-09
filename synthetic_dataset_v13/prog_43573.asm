; DESCRIPTION: Sets a single red pixel at (408, 93).
; PLAN: r0=408(x), r1=93(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 408
LDI r1, 93
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
