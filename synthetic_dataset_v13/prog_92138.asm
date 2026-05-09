; DESCRIPTION: Sets a single black pixel at (445, 86).
; PLAN: r0=445(x), r1=86(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 445
LDI r1, 86
LDI r2, 0x000000
PSET r0, r1, r2
HALT
