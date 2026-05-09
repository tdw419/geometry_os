; DESCRIPTION: Places a yellow dot at position (175, 2).
; PLAN: r0=175(x), r1=2(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 175
LDI r1, 2
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
