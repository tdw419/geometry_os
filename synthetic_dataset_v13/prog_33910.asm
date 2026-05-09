; DESCRIPTION: Places a red dot at position (176, 156).
; PLAN: r0=176(x), r1=156(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 176
LDI r1, 156
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
