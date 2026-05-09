; DESCRIPTION: Sets a single cyan pixel at (56, 108).
; PLAN: r0=56(x), r1=108(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 56
LDI r1, 108
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
