; DESCRIPTION: Sets a single green pixel at (180, 91).
; PLAN: r0=180(x), r1=91(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 180
LDI r1, 91
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
