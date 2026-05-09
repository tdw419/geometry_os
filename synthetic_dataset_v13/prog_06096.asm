; DESCRIPTION: Sets a single orange pixel at (511, 55).
; PLAN: r0=511(x), r1=55(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 511
LDI r1, 55
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
