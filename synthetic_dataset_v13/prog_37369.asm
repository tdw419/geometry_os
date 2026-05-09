; DESCRIPTION: Sets a single black pixel at (464, 44).
; PLAN: r0=464(x), r1=44(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 464
LDI r1, 44
LDI r2, 0x000000
PSET r0, r1, r2
HALT
