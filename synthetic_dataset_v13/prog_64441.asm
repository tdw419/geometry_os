; DESCRIPTION: Places a red dot at position (459, 49).
; PLAN: r0=459(x), r1=49(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 459
LDI r1, 49
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
