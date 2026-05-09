; DESCRIPTION: Composite: Creates a black rectangular region at (92, 149) spanning 66 by 67 pixels then Draws a yellow line from (276, 60) to (80, 91) then Creates a cyan circular shape at (127, 167) with radius 57.
; PLAN: r0=92(x), r1=149(y), r2=66(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=276(x1), r6=60(y1), r7=80(x2), r8=91(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=127(x), r11=167(y), r12=57(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 92
LDI r1, 149
LDI r2, 66
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 60
LDI r7, 80
LDI r8, 91
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 127
LDI r11, 167
LDI r12, 57
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
