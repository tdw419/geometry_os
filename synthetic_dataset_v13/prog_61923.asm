; DESCRIPTION: Sets a single cyan pixel at (284, 179).
; PLAN: r0=284(x), r1=179(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 284
LDI r1, 179
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
