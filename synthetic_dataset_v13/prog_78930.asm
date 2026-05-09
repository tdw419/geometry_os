; DESCRIPTION: Places a red dot at position (68, 57).
; PLAN: r0=68(x), r1=57(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 68
LDI r1, 57
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
