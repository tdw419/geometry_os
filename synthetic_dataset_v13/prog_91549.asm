; DESCRIPTION: Places a red dot at position (234, 169).
; PLAN: r0=234(x), r1=169(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 234
LDI r1, 169
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
