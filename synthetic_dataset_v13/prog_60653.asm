; DESCRIPTION: Places a black dot at position (357, 242).
; PLAN: r0=357(x), r1=242(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 357
LDI r1, 242
LDI r2, 0x000000
PSET r0, r1, r2
HALT
