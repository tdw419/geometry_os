; DESCRIPTION: Composite: Sets a single orange pixel at (199, 75) then Renders a yellow line between points (323, 214) and (115, 201) then Draws a blue rectangle at (317, 91) with width 109 and height 65.
; PLAN: r0=199(x), r1=75(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=323(x1), r6=214(y1), r7=115(x2), r8=201(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=317(x), r11=91(y), r12=109(width), r13=65(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 199
LDI r1, 75
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 323
LDI r6, 214
LDI r7, 115
LDI r8, 201
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 317
LDI r11, 91
LDI r12, 109
LDI r13, 65
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
