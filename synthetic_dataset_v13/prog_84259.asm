; DESCRIPTION: Sets a single black pixel at (240, 21).
; PLAN: r0=240(x), r1=21(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 240
LDI r1, 21
LDI r2, 0x000000
PSET r0, r1, r2
HALT
