; DESCRIPTION: Sets a single black pixel at (455, 208).
; PLAN: r0=455(x), r1=208(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 455
LDI r1, 208
LDI r2, 0x000000
PSET r0, r1, r2
HALT
