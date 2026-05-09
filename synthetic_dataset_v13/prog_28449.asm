; DESCRIPTION: Places a yellow dot at position (30, 146).
; PLAN: r0=30(x), r1=146(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 30
LDI r1, 146
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
