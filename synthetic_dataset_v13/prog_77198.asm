; DESCRIPTION: Sets a single green pixel at (447, 214).
; PLAN: r0=447(x), r1=214(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 447
LDI r1, 214
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
