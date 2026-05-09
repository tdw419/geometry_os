; DESCRIPTION: Composite: Places a magenta 117x58 rectangle at position (379, 70) then Renders a green line between points (314, 40) and (151, 156) then Renders a orange disk with center (251, 177) and radius 44.
; PLAN: r0=379(x), r1=70(y), r2=117(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=314(x1), r6=40(y1), r7=151(x2), r8=156(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=251(x), r11=177(y), r12=44(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 379
LDI r1, 70
LDI r2, 117
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 40
LDI r7, 151
LDI r8, 156
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 251
LDI r11, 177
LDI r12, 44
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
