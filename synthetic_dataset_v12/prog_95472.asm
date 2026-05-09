; DESCRIPTION: Places a cyan dot at position (176, 37).
; PLAN: r0=176(x), r1=37(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 176
LDI r1, 37
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
