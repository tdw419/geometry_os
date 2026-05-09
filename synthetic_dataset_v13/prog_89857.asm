; DESCRIPTION: Places a cyan dot at position (179, 255).
; PLAN: r0=179(x), r1=255(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 179
LDI r1, 255
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
