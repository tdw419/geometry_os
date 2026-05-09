; DESCRIPTION: Sets a single red pixel at (113, 24).
; PLAN: r0=113(x), r1=24(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 113
LDI r1, 24
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
