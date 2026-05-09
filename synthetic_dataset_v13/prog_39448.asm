; DESCRIPTION: Places a yellow dot at position (216, 171).
; PLAN: r0=216(x), r1=171(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 216
LDI r1, 171
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
