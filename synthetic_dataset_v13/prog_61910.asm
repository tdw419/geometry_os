; DESCRIPTION: Sets a single orange pixel at (474, 168).
; PLAN: r0=474(x), r1=168(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 474
LDI r1, 168
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
