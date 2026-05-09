; DESCRIPTION: Places a yellow dot at position (350, 161).
; PLAN: r0=350(x), r1=161(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 350
LDI r1, 161
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
