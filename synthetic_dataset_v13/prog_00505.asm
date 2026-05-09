; DESCRIPTION: Places a yellow dot at position (197, 24).
; PLAN: r0=197(x), r1=24(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 197
LDI r1, 24
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
