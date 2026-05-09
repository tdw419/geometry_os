; DESCRIPTION: Sets a single red pixel at (255, 176).
; PLAN: r0=255(x), r1=176(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 255
LDI r1, 176
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
