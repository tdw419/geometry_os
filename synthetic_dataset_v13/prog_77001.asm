; DESCRIPTION: Places a green dot at position (180, 234).
; PLAN: r0=180(x), r1=234(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 180
LDI r1, 234
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
