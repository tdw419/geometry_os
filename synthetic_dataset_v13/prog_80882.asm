; DESCRIPTION: Places a red dot at position (372, 208).
; PLAN: r0=372(x), r1=208(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 372
LDI r1, 208
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
