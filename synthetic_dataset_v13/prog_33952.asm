; DESCRIPTION: Sets a single cyan pixel at (128, 198).
; PLAN: r0=128(x), r1=198(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 128
LDI r1, 198
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
