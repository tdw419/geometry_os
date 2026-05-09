; DESCRIPTION: Places a cyan dot at position (456, 150).
; PLAN: r0=456(x), r1=150(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 456
LDI r1, 150
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
