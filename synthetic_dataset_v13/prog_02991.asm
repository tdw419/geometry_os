; DESCRIPTION: Places a red dot at position (342, 254).
; PLAN: r0=342(x), r1=254(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 342
LDI r1, 254
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
