; DESCRIPTION: Composite: Draws a orange circle centered at (91, 92) with radius 79 then Draws a green line from (44, 30) to (345, 223) then Creates a orange rectangular region at (123, 178) spanning 48 by 77 pixels.
; PLAN: r0=91(x), r1=92(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=44(x1), r6=30(y1), r7=345(x2), r8=223(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=123(x), r11=178(y), r12=48(width), r13=77(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 91
LDI r1, 92
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 44
LDI r6, 30
LDI r7, 345
LDI r8, 223
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 123
LDI r11, 178
LDI r12, 48
LDI r13, 77
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
