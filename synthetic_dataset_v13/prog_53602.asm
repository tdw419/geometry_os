; DESCRIPTION: Places a yellow dot at position (299, 131).
; PLAN: r0=299(x), r1=131(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 299
LDI r1, 131
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
