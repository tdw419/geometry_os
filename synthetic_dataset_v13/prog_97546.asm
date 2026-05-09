; DESCRIPTION: Composite: Places a cyan line segment connecting (370, 244) to (487, 198) then Creates a green circular shape at (232, 117) with radius 72 then Sets a single orange pixel at (309, 14).
; PLAN: r0=370(x1), r1=244(y1), r2=487(x2), r3=198(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=232(x), r6=117(y), r7=72(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=309(x), r11=14(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 370
LDI r1, 244
LDI r2, 487
LDI r3, 198
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 232
LDI r6, 117
LDI r7, 72
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 309
LDI r11, 14
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
