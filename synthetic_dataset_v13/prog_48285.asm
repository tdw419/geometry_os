; DESCRIPTION: Places a red dot at position (111, 207).
; PLAN: r0=111(x), r1=207(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 111
LDI r1, 207
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
