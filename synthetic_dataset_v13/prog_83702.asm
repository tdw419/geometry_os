; DESCRIPTION: Places a green dot at position (232, 193).
; PLAN: r0=232(x), r1=193(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 232
LDI r1, 193
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
