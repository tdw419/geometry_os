; DESCRIPTION: Composite: Places a yellow line segment connecting (259, 184) to (285, 249) then Draws a yellow circle centered at (353, 132) with radius 46 then Sets a single orange pixel at (187, 85).
; PLAN: r0=259(x1), r1=184(y1), r2=285(x2), r3=249(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=353(x), r6=132(y), r7=46(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=187(x), r11=85(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 259
LDI r1, 184
LDI r2, 285
LDI r3, 249
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 353
LDI r6, 132
LDI r7, 46
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 187
LDI r11, 85
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
