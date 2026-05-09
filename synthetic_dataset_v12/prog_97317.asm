; DESCRIPTION: Places a cyan dot at position (86, 236).
; PLAN: r0=86(x), r1=236(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 86
LDI r1, 236
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
