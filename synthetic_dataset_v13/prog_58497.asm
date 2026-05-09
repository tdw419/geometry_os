; DESCRIPTION: Places a cyan dot at position (57, 46).
; PLAN: r0=57(x), r1=46(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 57
LDI r1, 46
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
