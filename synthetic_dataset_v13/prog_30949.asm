; DESCRIPTION: Sets a single black pixel at (482, 37).
; PLAN: r0=482(x), r1=37(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 482
LDI r1, 37
LDI r2, 0x000000
PSET r0, r1, r2
HALT
