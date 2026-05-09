; DESCRIPTION: Places a cyan dot at position (476, 221).
; PLAN: r0=476(x), r1=221(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 476
LDI r1, 221
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
