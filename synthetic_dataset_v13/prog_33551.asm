; DESCRIPTION: Composite: Draws a blue circle centered at (440, 189) with radius 54 then Sets a single cyan pixel at (53, 65).
; PLAN: r0=440(x), r1=189(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=53(x), r6=65(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 440
LDI r1, 189
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 53
LDI r6, 65
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
