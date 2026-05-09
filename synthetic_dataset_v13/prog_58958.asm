; DESCRIPTION: Places a cyan dot at position (454, 207).
; PLAN: r0=454(x), r1=207(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 454
LDI r1, 207
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
