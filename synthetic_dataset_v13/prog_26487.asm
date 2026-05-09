; DESCRIPTION: Places a red dot at position (402, 107).
; PLAN: r0=402(x), r1=107(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 402
LDI r1, 107
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
