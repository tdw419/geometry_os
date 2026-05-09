; DESCRIPTION: Composite: Draws a yellow circle centered at (112, 155) with radius 75 then Renders a green line between points (14, 21) and (281, 30).
; PLAN: r0=112(x), r1=155(y), r2=75(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=14(x1), r6=21(y1), r7=281(x2), r8=30(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 112
LDI r1, 155
LDI r2, 75
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 14
LDI r6, 21
LDI r7, 281
LDI r8, 30
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
