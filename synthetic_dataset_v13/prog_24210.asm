; DESCRIPTION: Places a yellow dot at position (124, 253).
; PLAN: r0=124(x), r1=253(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 124
LDI r1, 253
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
