; DESCRIPTION: Places a green dot at position (273, 143).
; PLAN: r0=273(x), r1=143(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 273
LDI r1, 143
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
