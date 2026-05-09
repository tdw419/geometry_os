; DESCRIPTION: Places a red dot at position (244, 157).
; PLAN: r0=244(x), r1=157(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 244
LDI r1, 157
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
