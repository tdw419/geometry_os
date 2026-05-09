; DESCRIPTION: Places a red dot at position (463, 225).
; PLAN: r0=463(x), r1=225(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 463
LDI r1, 225
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
