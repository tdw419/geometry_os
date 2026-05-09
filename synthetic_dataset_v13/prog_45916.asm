; DESCRIPTION: Sets a single black pixel at (286, 111).
; PLAN: r0=286(x), r1=111(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 286
LDI r1, 111
LDI r2, 0x000000
PSET r0, r1, r2
HALT
