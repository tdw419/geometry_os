; DESCRIPTION: Places a black dot at position (295, 249).
; PLAN: r0=295(x), r1=249(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 295
LDI r1, 249
LDI r2, 0x000000
PSET r0, r1, r2
HALT
