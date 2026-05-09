; DESCRIPTION: Places a cyan dot at position (127, 73).
; PLAN: r0=127(x), r1=73(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 127
LDI r1, 73
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
