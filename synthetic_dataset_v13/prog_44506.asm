; DESCRIPTION: Composite: Places a yellow circle of radius 47 at center (332, 65) then Renders a orange line between points (22, 249) and (136, 160).
; PLAN: r0=332(x), r1=65(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=22(x1), r6=249(y1), r7=136(x2), r8=160(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 332
LDI r1, 65
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 22
LDI r6, 249
LDI r7, 136
LDI r8, 160
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
