; DESCRIPTION: Composite: Sets a single yellow pixel at (61, 252) then Places a magenta line segment connecting (94, 227) to (232, 131) then Draws a orange rectangle at (357, 32) with width 60 and height 87.
; PLAN: r0=61(x), r1=252(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=94(x1), r6=227(y1), r7=232(x2), r8=131(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=357(x), r11=32(y), r12=60(width), r13=87(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 61
LDI r1, 252
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 94
LDI r6, 227
LDI r7, 232
LDI r8, 131
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 357
LDI r11, 32
LDI r12, 60
LDI r13, 87
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
