; DESCRIPTION: Places a blue dot at position (340, 235).
; PLAN: r0=340(x), r1=235(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 340
LDI r1, 235
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
