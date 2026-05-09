; DESCRIPTION: Composite: Creates a yellow rectangular region at (314, 206) spanning 20 by 13 pixels then Places a magenta line segment connecting (350, 20) to (346, 133) then Sets a single black pixel at (407, 226).
; PLAN: r0=314(x), r1=206(y), r2=20(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=350(x1), r6=20(y1), r7=346(x2), r8=133(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=407(x), r11=226(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 314
LDI r1, 206
LDI r2, 20
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 20
LDI r7, 346
LDI r8, 133
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 407
LDI r11, 226
LDI r12, 0x000000
PSET r10, r11, r12
HALT
