; DESCRIPTION: Composite: Draws a cyan circle centered at (453, 110) with radius 49 then Places a orange dot at position (54, 40).
; PLAN: r0=453(x), r1=110(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=54(x), r6=40(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 453
LDI r1, 110
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 54
LDI r6, 40
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
