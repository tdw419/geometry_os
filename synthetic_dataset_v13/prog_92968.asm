; DESCRIPTION: Sets a single green pixel at (362, 98).
; PLAN: r0=362(x), r1=98(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 362
LDI r1, 98
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
