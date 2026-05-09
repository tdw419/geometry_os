; DESCRIPTION: Composite: Draws a white circle centered at (185, 76) with radius 40 then Draws a yellow line from (115, 56) to (36, 195) then Sets a single cyan pixel at (490, 202).
; PLAN: r0=185(x), r1=76(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=115(x1), r6=56(y1), r7=36(x2), r8=195(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=490(x), r11=202(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 185
LDI r1, 76
LDI r2, 40
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 115
LDI r6, 56
LDI r7, 36
LDI r8, 195
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 490
LDI r11, 202
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
