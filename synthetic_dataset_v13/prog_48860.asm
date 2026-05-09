; DESCRIPTION: Sets a single red pixel at (480, 53).
; PLAN: r0=480(x), r1=53(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 480
LDI r1, 53
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
