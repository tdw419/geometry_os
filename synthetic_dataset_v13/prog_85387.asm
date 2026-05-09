; DESCRIPTION: Sets a single cyan pixel at (165, 181).
; PLAN: r0=165(x), r1=181(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 165
LDI r1, 181
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
