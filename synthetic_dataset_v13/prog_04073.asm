; DESCRIPTION: Places a cyan dot at position (406, 246).
; PLAN: r0=406(x), r1=246(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 406
LDI r1, 246
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
