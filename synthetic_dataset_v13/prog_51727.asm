; DESCRIPTION: Sets a single red pixel at (459, 111).
; PLAN: r0=459(x), r1=111(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 459
LDI r1, 111
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
