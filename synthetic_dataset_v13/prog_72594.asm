; DESCRIPTION: Sets a single cyan pixel at (108, 37).
; PLAN: r0=108(x), r1=37(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 108
LDI r1, 37
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
