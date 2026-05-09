; DESCRIPTION: Places a cyan dot at position (371, 172).
; PLAN: r0=371(x), r1=172(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 371
LDI r1, 172
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
