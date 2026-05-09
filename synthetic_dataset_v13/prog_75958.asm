; DESCRIPTION: Places a red dot at position (492, 85).
; PLAN: r0=492(x), r1=85(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 492
LDI r1, 85
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
