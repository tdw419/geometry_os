; DESCRIPTION: Places a green dot at position (458, 132).
; PLAN: r0=458(x), r1=132(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 458
LDI r1, 132
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
