; DESCRIPTION: Composite: Creates a yellow circular shape at (384, 115) with radius 63 then Places a magenta line segment connecting (485, 84) to (326, 49) then Sets a single green pixel at (334, 23).
; PLAN: r0=384(x), r1=115(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=485(x1), r6=84(y1), r7=326(x2), r8=49(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=334(x), r11=23(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 384
LDI r1, 115
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 485
LDI r6, 84
LDI r7, 326
LDI r8, 49
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 334
LDI r11, 23
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
