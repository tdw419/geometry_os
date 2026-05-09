; DESCRIPTION: Sets a single cyan pixel at (72, 187).
; PLAN: r0=72(x), r1=187(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 72
LDI r1, 187
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
