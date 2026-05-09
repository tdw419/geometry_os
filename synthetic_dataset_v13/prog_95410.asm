; DESCRIPTION: Composite: Creates a magenta rectangular region at (336, 65) spanning 113 by 44 pixels then Sets a single orange pixel at (430, 250) then Draws a orange line from (440, 239) to (357, 5).
; PLAN: r0=336(x), r1=65(y), r2=113(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=430(x), r6=250(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=440(x1), r11=239(y1), r12=357(x2), r13=5(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 336
LDI r1, 65
LDI r2, 113
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 430
LDI r6, 250
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 440
LDI r11, 239
LDI r12, 357
LDI r13, 5
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
