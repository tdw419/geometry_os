; DESCRIPTION: Places a cyan dot at position (75, 242).
; PLAN: r0=75(x), r1=242(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 75
LDI r1, 242
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
