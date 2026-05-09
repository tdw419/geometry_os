; DESCRIPTION: Sets a single red pixel at (107, 210).
; PLAN: r0=107(x), r1=210(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 107
LDI r1, 210
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
