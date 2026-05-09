; DESCRIPTION: Places a white dot at position (380, 146).
; PLAN: r0=380(x), r1=146(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 380
LDI r1, 146
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
