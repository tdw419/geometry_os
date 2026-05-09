; DESCRIPTION: Draws a cyan circle centered at (216, 89) with radius 47.
; PLAN: r0=216(x), r1=89(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 89
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
