; DESCRIPTION: Places a cyan dot at position (144, 17).
; PLAN: r0=144(x), r1=17(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 144
LDI r1, 17
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
