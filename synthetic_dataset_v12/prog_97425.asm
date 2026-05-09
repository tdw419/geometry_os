; DESCRIPTION: Places a cyan dot at position (475, 254).
; PLAN: r0=475(x), r1=254(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 475
LDI r1, 254
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
