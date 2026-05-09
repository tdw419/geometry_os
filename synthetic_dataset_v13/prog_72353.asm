; DESCRIPTION: Sets a single black pixel at (465, 168).
; PLAN: r0=465(x), r1=168(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 465
LDI r1, 168
LDI r2, 0x000000
PSET r0, r1, r2
HALT
