; DESCRIPTION: Places a green dot at position (250, 235).
; PLAN: r0=250(x), r1=235(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 250
LDI r1, 235
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
