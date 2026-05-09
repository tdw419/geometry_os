; DESCRIPTION: Sets a single red pixel at (74, 16).
; PLAN: r0=74(x), r1=16(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 74
LDI r1, 16
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
