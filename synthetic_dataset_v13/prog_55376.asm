; DESCRIPTION: Composite: Draws a purple circle centered at (48, 68) with radius 24 then Draws a yellow line from (222, 91) to (462, 17).
; PLAN: r0=48(x), r1=68(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=222(x1), r6=91(y1), r7=462(x2), r8=17(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 48
LDI r1, 68
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 222
LDI r6, 91
LDI r7, 462
LDI r8, 17
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
