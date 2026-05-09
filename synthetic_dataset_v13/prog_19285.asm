; DESCRIPTION: Places a green dot at position (181, 214).
; PLAN: r0=181(x), r1=214(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 181
LDI r1, 214
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
