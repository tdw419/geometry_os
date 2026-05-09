; DESCRIPTION: Places a cyan dot at position (412, 249).
; PLAN: r0=412(x), r1=249(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 412
LDI r1, 249
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
