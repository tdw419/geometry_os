; DESCRIPTION: Places a red dot at position (362, 191).
; PLAN: r0=362(x), r1=191(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 362
LDI r1, 191
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
