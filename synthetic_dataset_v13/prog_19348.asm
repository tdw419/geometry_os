; DESCRIPTION: Sets a single cyan pixel at (161, 117).
; PLAN: r0=161(x), r1=117(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 161
LDI r1, 117
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
