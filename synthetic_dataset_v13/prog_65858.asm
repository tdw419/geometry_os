; DESCRIPTION: Sets a single cyan pixel at (487, 234).
; PLAN: r0=487(x), r1=234(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 487
LDI r1, 234
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
