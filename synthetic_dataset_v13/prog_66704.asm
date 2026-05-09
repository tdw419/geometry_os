; DESCRIPTION: Places a purple dot at position (344, 21).
; PLAN: r0=344(x), r1=21(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 344
LDI r1, 21
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
