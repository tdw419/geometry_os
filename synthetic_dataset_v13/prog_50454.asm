; DESCRIPTION: Composite: Draws a orange circle centered at (40, 84) with radius 31 then Renders a yellow line between points (243, 217) and (470, 10) then Sets a single orange pixel at (353, 226).
; PLAN: r0=40(x), r1=84(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=243(x1), r6=217(y1), r7=470(x2), r8=10(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=353(x), r11=226(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 40
LDI r1, 84
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 243
LDI r6, 217
LDI r7, 470
LDI r8, 10
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 353
LDI r11, 226
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
