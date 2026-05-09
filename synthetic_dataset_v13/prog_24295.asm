; DESCRIPTION: Composite: Places a green dot at position (91, 60) then Renders a blue line between points (246, 17) and (462, 21) then Renders a white box of size 112x115 starting at (147, 80).
; PLAN: r0=91(x), r1=60(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=246(x1), r6=17(y1), r7=462(x2), r8=21(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=147(x), r11=80(y), r12=112(width), r13=115(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 91
LDI r1, 60
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 246
LDI r6, 17
LDI r7, 462
LDI r8, 21
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 147
LDI r11, 80
LDI r12, 112
LDI r13, 115
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
