; DESCRIPTION: Composite: Draws a orange line from (390, 202) to (488, 150) then Creates a magenta rectangular region at (45, 54) spanning 18 by 66 pixels then Draws a cyan circle centered at (408, 100) with radius 47.
; PLAN: r0=390(x1), r1=202(y1), r2=488(x2), r3=150(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=45(x), r6=54(y), r7=18(width), r8=66(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=408(x), r11=100(y), r12=47(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 390
LDI r1, 202
LDI r2, 488
LDI r3, 150
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 54
LDI r7, 18
LDI r8, 66
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 408
LDI r11, 100
LDI r12, 47
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
