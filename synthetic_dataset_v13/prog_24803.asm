; DESCRIPTION: Places a red dot at position (156, 206).
; PLAN: r0=156(x), r1=206(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 156
LDI r1, 206
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
