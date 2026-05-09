; DESCRIPTION: Places a yellow dot at position (162, 209).
; PLAN: r0=162(x), r1=209(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 162
LDI r1, 209
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
