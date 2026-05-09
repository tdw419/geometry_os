; DESCRIPTION: Places a red dot at position (62, 117).
; PLAN: r0=62(x), r1=117(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 62
LDI r1, 117
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
