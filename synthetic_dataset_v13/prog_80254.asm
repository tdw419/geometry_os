; DESCRIPTION: Places a red dot at position (135, 185).
; PLAN: r0=135(x), r1=185(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 135
LDI r1, 185
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
