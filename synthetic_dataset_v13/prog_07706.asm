; DESCRIPTION: Draws a cyan circle centered at (177, 89) with radius 58.
; PLAN: r0=177(x), r1=89(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 89
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
