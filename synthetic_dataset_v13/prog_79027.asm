; DESCRIPTION: Sets a single orange pixel at (147, 164).
; PLAN: r0=147(x), r1=164(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 147
LDI r1, 164
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
