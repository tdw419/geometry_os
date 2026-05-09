; DESCRIPTION: Sets a single green pixel at (22, 174).
; PLAN: r0=22(x), r1=174(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 22
LDI r1, 174
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
