; DESCRIPTION: Places a yellow dot at position (138, 214).
; PLAN: r0=138(x), r1=214(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 138
LDI r1, 214
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
