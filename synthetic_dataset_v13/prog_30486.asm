; DESCRIPTION: Composite: Places a green line segment connecting (429, 40) to (6, 211) then Creates a green rectangular region at (225, 11) spanning 50 by 57 pixels then Renders a magenta disk with center (411, 147) and radius 78.
; PLAN: r0=429(x1), r1=40(y1), r2=6(x2), r3=211(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=225(x), r6=11(y), r7=50(width), r8=57(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=411(x), r11=147(y), r12=78(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 429
LDI r1, 40
LDI r2, 6
LDI r3, 211
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 225
LDI r6, 11
LDI r7, 50
LDI r8, 57
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 411
LDI r11, 147
LDI r12, 78
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
