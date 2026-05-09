; DESCRIPTION: Places a cyan dot at position (305, 0).
; PLAN: r0=305(x), r1=0(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 305
LDI r1, 0
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
