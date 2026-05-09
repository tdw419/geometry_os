; DESCRIPTION: Places a red dot at position (421, 142).
; PLAN: r0=421(x), r1=142(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 421
LDI r1, 142
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
