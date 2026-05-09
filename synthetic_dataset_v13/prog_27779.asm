; DESCRIPTION: Sets a single orange pixel at (329, 111).
; PLAN: r0=329(x), r1=111(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 329
LDI r1, 111
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
