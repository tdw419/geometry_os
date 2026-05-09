; DESCRIPTION: Places a cyan dot at position (374, 62).
; PLAN: r0=374(x), r1=62(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 374
LDI r1, 62
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
