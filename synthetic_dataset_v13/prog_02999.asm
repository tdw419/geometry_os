; DESCRIPTION: Places a yellow dot at position (316, 20).
; PLAN: r0=316(x), r1=20(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 316
LDI r1, 20
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
