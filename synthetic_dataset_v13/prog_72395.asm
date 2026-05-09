; DESCRIPTION: Composite: Draws a orange circle centered at (245, 90) with radius 40 then Renders a yellow line between points (492, 162) and (194, 231) then Sets a single orange pixel at (93, 29).
; PLAN: r0=245(x), r1=90(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=492(x1), r6=162(y1), r7=194(x2), r8=231(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=93(x), r11=29(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 245
LDI r1, 90
LDI r2, 40
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 492
LDI r6, 162
LDI r7, 194
LDI r8, 231
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 93
LDI r11, 29
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
