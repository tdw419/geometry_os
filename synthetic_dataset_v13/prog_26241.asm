; DESCRIPTION: Sets a single red pixel at (347, 192).
; PLAN: r0=347(x), r1=192(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 347
LDI r1, 192
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
