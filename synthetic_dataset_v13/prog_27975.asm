; DESCRIPTION: Places a red dot at position (474, 162).
; PLAN: r0=474(x), r1=162(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 474
LDI r1, 162
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
