; DESCRIPTION: Places a black dot at position (340, 5).
; PLAN: r0=340(x), r1=5(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 340
LDI r1, 5
LDI r2, 0x000000
PSET r0, r1, r2
HALT
