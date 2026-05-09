; DESCRIPTION: Composite: Places a white line segment connecting (220, 161) to (68, 27) then Draws a purple circle centered at (449, 78) with radius 61 then Sets a single green pixel at (210, 23).
; PLAN: r0=220(x1), r1=161(y1), r2=68(x2), r3=27(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=449(x), r6=78(y), r7=61(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=210(x), r11=23(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 220
LDI r1, 161
LDI r2, 68
LDI r3, 27
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 449
LDI r6, 78
LDI r7, 61
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 210
LDI r11, 23
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
