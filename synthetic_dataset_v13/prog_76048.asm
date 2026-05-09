; DESCRIPTION: Places a red dot at position (436, 183).
; PLAN: r0=436(x), r1=183(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 436
LDI r1, 183
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
