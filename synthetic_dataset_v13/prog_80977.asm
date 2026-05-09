; DESCRIPTION: Places a cyan dot at position (476, 208).
; PLAN: r0=476(x), r1=208(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 476
LDI r1, 208
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
