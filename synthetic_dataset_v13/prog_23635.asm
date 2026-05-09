; DESCRIPTION: Composite: Places a green dot at position (280, 112) then Places a magenta line segment connecting (200, 34) to (350, 115) then Draws a green rectangle at (390, 49) with width 85 and height 39.
; PLAN: r0=280(x), r1=112(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=200(x1), r6=34(y1), r7=350(x2), r8=115(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=390(x), r11=49(y), r12=85(width), r13=39(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 280
LDI r1, 112
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 200
LDI r6, 34
LDI r7, 350
LDI r8, 115
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 390
LDI r11, 49
LDI r12, 85
LDI r13, 39
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
