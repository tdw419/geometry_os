; DESCRIPTION: Places a cyan dot at position (344, 88).
; PLAN: r0=344(x), r1=88(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 344
LDI r1, 88
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
