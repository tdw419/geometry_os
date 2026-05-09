; DESCRIPTION: Sets a single orange pixel at (180, 159).
; PLAN: r0=180(x), r1=159(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 180
LDI r1, 159
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
