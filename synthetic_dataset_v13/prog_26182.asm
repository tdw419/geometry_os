; DESCRIPTION: Places a red dot at position (195, 249).
; PLAN: r0=195(x), r1=249(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 195
LDI r1, 249
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
