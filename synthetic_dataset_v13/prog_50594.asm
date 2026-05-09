; DESCRIPTION: Composite: Draws a orange line from (174, 95) to (273, 212) then Creates a magenta rectangular region at (269, 146) spanning 83 by 27 pixels then Places a white circle of radius 37 at center (410, 94).
; PLAN: r0=174(x1), r1=95(y1), r2=273(x2), r3=212(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=269(x), r6=146(y), r7=83(width), r8=27(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=410(x), r11=94(y), r12=37(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 174
LDI r1, 95
LDI r2, 273
LDI r3, 212
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 269
LDI r6, 146
LDI r7, 83
LDI r8, 27
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 410
LDI r11, 94
LDI r12, 37
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
