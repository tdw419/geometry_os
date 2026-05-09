; DESCRIPTION: Sets a single yellow pixel at (411, 16).
; PLAN: r0=411(x), r1=16(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 411
LDI r1, 16
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
