; DESCRIPTION: Sets a single orange pixel at (482, 27).
; PLAN: r0=482(x), r1=27(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 482
LDI r1, 27
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
