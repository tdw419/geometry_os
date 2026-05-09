; DESCRIPTION: Places a red dot at position (188, 166).
; PLAN: r0=188(x), r1=166(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 188
LDI r1, 166
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
