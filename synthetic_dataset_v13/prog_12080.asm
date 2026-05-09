; DESCRIPTION: Sets a single magenta pixel at (235, 142).
; PLAN: r0=235(x), r1=142(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 235
LDI r1, 142
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
