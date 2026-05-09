; DESCRIPTION: Places a red dot at position (274, 133).
; PLAN: r0=274(x), r1=133(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 274
LDI r1, 133
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
