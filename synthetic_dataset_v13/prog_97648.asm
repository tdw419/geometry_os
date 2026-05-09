; DESCRIPTION: Sets a single green pixel at (302, 169).
; PLAN: r0=302(x), r1=169(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 302
LDI r1, 169
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
