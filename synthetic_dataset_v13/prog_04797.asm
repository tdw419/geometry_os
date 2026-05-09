; DESCRIPTION: Places a black dot at position (234, 55).
; PLAN: r0=234(x), r1=55(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 234
LDI r1, 55
LDI r2, 0x000000
PSET r0, r1, r2
HALT
