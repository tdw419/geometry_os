; DESCRIPTION: Composite: Creates a yellow rectangular region at (102, 208) spanning 28 by 21 pixels then Places a green line segment connecting (3, 27) to (273, 146) then Draws a orange circle centered at (419, 164) with radius 62.
; PLAN: r0=102(x), r1=208(y), r2=28(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=3(x1), r6=27(y1), r7=273(x2), r8=146(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=419(x), r11=164(y), r12=62(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 102
LDI r1, 208
LDI r2, 28
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 3
LDI r6, 27
LDI r7, 273
LDI r8, 146
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 419
LDI r11, 164
LDI r12, 62
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
