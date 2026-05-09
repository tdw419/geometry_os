; DESCRIPTION: Sets a single black pixel at (281, 152).
; PLAN: r0=281(x), r1=152(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 281
LDI r1, 152
LDI r2, 0x000000
PSET r0, r1, r2
HALT
