; DESCRIPTION: Sets a single cyan pixel at (298, 246).
; PLAN: r0=298(x), r1=246(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 298
LDI r1, 246
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
