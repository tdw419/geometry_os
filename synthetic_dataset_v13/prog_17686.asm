; DESCRIPTION: Places a yellow dot at position (291, 93).
; PLAN: r0=291(x), r1=93(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 291
LDI r1, 93
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
