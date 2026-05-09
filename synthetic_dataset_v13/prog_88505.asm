; DESCRIPTION: Sets a single orange pixel at (237, 180).
; PLAN: r0=237(x), r1=180(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 237
LDI r1, 180
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
