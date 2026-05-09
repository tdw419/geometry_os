; DESCRIPTION: Places a yellow dot at position (364, 29).
; PLAN: r0=364(x), r1=29(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 364
LDI r1, 29
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
