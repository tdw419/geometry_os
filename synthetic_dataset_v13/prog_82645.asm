; DESCRIPTION: Sets a single orange pixel at (447, 254).
; PLAN: r0=447(x), r1=254(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 447
LDI r1, 254
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
