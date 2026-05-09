; DESCRIPTION: Places a red dot at position (326, 247).
; PLAN: r0=326(x), r1=247(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 326
LDI r1, 247
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
