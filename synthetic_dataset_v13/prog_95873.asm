; DESCRIPTION: Sets a single cyan pixel at (154, 229).
; PLAN: r0=154(x), r1=229(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 154
LDI r1, 229
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
