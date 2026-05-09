; DESCRIPTION: Places a cyan dot at position (415, 99).
; PLAN: r0=415(x), r1=99(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 415
LDI r1, 99
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
