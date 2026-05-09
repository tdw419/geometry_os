; DESCRIPTION: Places a cyan dot at position (484, 222).
; PLAN: r0=484(x), r1=222(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 484
LDI r1, 222
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
