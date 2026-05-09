; DESCRIPTION: Draws a cyan circle centered at (290, 89) with radius 26.
; PLAN: r0=290(x), r1=89(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 290
LDI r1, 89
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
