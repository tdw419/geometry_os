; DESCRIPTION: Places a green dot at position (124, 169).
; PLAN: r0=124(x), r1=169(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 124
LDI r1, 169
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
