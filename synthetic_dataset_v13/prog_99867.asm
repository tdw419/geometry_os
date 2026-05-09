; DESCRIPTION: Places a black dot at position (87, 213).
; PLAN: r0=87(x), r1=213(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 87
LDI r1, 213
LDI r2, 0x000000
PSET r0, r1, r2
HALT
