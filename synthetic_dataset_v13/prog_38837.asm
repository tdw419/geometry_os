; DESCRIPTION: Places a red dot at position (151, 52).
; PLAN: r0=151(x), r1=52(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 151
LDI r1, 52
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
