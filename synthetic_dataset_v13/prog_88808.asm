; DESCRIPTION: Places a black dot at position (360, 214).
; PLAN: r0=360(x), r1=214(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 360
LDI r1, 214
LDI r2, 0x000000
PSET r0, r1, r2
HALT
