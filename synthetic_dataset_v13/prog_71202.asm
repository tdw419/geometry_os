; DESCRIPTION: Sets a single black pixel at (84, 28).
; PLAN: r0=84(x), r1=28(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 84
LDI r1, 28
LDI r2, 0x000000
PSET r0, r1, r2
HALT
