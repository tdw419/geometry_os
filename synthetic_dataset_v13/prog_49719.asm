; DESCRIPTION: Sets a single orange pixel at (349, 219).
; PLAN: r0=349(x), r1=219(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 349
LDI r1, 219
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
