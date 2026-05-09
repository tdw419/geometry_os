; DESCRIPTION: Places a yellow dot at position (290, 82).
; PLAN: r0=290(x), r1=82(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 290
LDI r1, 82
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
