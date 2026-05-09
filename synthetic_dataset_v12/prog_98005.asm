; DESCRIPTION: Places a orange dot at position (425, 146).
; PLAN: r0=425(x), r1=146(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 425
LDI r1, 146
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
