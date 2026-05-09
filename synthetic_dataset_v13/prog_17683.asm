; DESCRIPTION: Sets a single red pixel at (180, 112).
; PLAN: r0=180(x), r1=112(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 180
LDI r1, 112
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
