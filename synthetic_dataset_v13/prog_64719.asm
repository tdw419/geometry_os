; DESCRIPTION: Sets a single black pixel at (210, 152).
; PLAN: r0=210(x), r1=152(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 210
LDI r1, 152
LDI r2, 0x000000
PSET r0, r1, r2
HALT
