; DESCRIPTION: Places a red dot at position (5, 86).
; PLAN: r0=5(x), r1=86(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 5
LDI r1, 86
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
