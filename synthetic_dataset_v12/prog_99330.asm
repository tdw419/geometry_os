; DESCRIPTION: Places a red dot at position (217, 49).
; PLAN: r0=217(x), r1=49(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 217
LDI r1, 49
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
