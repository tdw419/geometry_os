; DESCRIPTION: Places a red dot at position (344, 56).
; PLAN: r0=344(x), r1=56(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 344
LDI r1, 56
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
