; DESCRIPTION: Places a green dot at position (233, 75).
; PLAN: r0=233(x), r1=75(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 233
LDI r1, 75
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
