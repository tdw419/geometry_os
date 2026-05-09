; DESCRIPTION: Places a white dot at position (184, 41).
; PLAN: r0=184(x), r1=41(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 184
LDI r1, 41
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
