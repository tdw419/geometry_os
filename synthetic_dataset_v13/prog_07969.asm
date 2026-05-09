; DESCRIPTION: Sets a single cyan pixel at (364, 253).
; PLAN: r0=364(x), r1=253(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 364
LDI r1, 253
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
