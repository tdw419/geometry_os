; DESCRIPTION: Sets a single red pixel at (87, 173).
; PLAN: r0=87(x), r1=173(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 87
LDI r1, 173
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
