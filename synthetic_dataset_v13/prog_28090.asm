; DESCRIPTION: Sets a single red pixel at (21, 150).
; PLAN: r0=21(x), r1=150(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 21
LDI r1, 150
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
