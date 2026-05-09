; DESCRIPTION: Places a green dot at position (336, 187).
; PLAN: r0=336(x), r1=187(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 336
LDI r1, 187
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
