; DESCRIPTION: Places a cyan dot at position (162, 128).
; PLAN: r0=162(x), r1=128(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 162
LDI r1, 128
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
