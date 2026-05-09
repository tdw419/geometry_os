; DESCRIPTION: Places a green dot at position (215, 208).
; PLAN: r0=215(x), r1=208(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 215
LDI r1, 208
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
