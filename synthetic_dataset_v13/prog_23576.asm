; DESCRIPTION: Sets a single orange pixel at (510, 255).
; PLAN: r0=510(x), r1=255(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 510
LDI r1, 255
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
