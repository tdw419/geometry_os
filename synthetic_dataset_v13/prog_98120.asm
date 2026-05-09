; DESCRIPTION: Sets a single white pixel at (504, 229).
; PLAN: r0=504(x), r1=229(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 504
LDI r1, 229
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
