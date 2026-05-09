; DESCRIPTION: Sets a single red pixel at (333, 219).
; PLAN: r0=333(x), r1=219(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 333
LDI r1, 219
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
