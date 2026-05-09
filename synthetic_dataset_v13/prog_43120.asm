; DESCRIPTION: Places a red dot at position (40, 143).
; PLAN: r0=40(x), r1=143(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 40
LDI r1, 143
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
