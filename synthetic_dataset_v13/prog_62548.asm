; DESCRIPTION: Composite: Sets a single white pixel at (91, 8) then Places a white line segment connecting (427, 63) to (248, 79) then Renders a white box of size 78x60 starting at (357, 89).
; PLAN: r0=91(x), r1=8(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=427(x1), r6=63(y1), r7=248(x2), r8=79(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=357(x), r11=89(y), r12=78(width), r13=60(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 91
LDI r1, 8
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 427
LDI r6, 63
LDI r7, 248
LDI r8, 79
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 357
LDI r11, 89
LDI r12, 78
LDI r13, 60
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
