; DESCRIPTION: Places a yellow dot at position (95, 204).
; PLAN: r0=95(x), r1=204(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 95
LDI r1, 204
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
