; DESCRIPTION: Places a green dot at position (408, 41).
; PLAN: r0=408(x), r1=41(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 408
LDI r1, 41
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
