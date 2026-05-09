; DESCRIPTION: Composite: Places a purple line segment connecting (291, 250) to (239, 170) then Creates a cyan circular shape at (299, 115) with radius 75 then Sets a single magenta pixel at (19, 72).
; PLAN: r0=291(x1), r1=250(y1), r2=239(x2), r3=170(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=299(x), r6=115(y), r7=75(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=19(x), r11=72(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 291
LDI r1, 250
LDI r2, 239
LDI r3, 170
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 115
LDI r7, 75
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 19
LDI r11, 72
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
