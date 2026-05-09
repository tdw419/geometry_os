; DESCRIPTION: Draws a cyan circle centered at (486, 200) with radius 11.
; PLAN: r0=486(x), r1=200(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 486
LDI r1, 200
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
