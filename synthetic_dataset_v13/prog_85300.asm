; DESCRIPTION: Sets a single red pixel at (464, 95).
; PLAN: r0=464(x), r1=95(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 464
LDI r1, 95
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
