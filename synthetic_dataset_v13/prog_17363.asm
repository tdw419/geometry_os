; DESCRIPTION: Sets a single red pixel at (171, 40).
; PLAN: r0=171(x), r1=40(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 171
LDI r1, 40
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
