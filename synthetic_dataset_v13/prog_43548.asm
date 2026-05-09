; DESCRIPTION: Places a yellow dot at position (70, 246).
; PLAN: r0=70(x), r1=246(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 70
LDI r1, 246
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
