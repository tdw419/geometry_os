; DESCRIPTION: Sets a single cyan pixel at (264, 111).
; PLAN: r0=264(x), r1=111(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 264
LDI r1, 111
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
