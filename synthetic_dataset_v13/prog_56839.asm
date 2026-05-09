; DESCRIPTION: Places a yellow dot at position (152, 19).
; PLAN: r0=152(x), r1=19(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 152
LDI r1, 19
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
