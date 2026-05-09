; DESCRIPTION: Sets a single red pixel at (250, 209).
; PLAN: r0=250(x), r1=209(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 250
LDI r1, 209
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
