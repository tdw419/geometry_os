; DESCRIPTION: Places a cyan dot at position (160, 231).
; PLAN: r0=160(x), r1=231(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 160
LDI r1, 231
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
