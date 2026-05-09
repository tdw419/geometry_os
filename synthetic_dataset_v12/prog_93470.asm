; DESCRIPTION: Draws a cyan circle centered at (486, 89) with radius 24.
; PLAN: r0=486(x), r1=89(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 486
LDI r1, 89
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
