; DESCRIPTION: Sets a single orange pixel at (82, 209).
; PLAN: r0=82(x), r1=209(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 82
LDI r1, 209
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
