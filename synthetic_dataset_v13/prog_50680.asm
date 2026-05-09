; DESCRIPTION: Composite: Creates a yellow rectangular region at (214, 115) spanning 104 by 110 pixels then Draws a blue line from (292, 114) to (366, 211) then Sets a single green pixel at (482, 150).
; PLAN: r0=214(x), r1=115(y), r2=104(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=292(x1), r6=114(y1), r7=366(x2), r8=211(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=482(x), r11=150(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 214
LDI r1, 115
LDI r2, 104
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 292
LDI r6, 114
LDI r7, 366
LDI r8, 211
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 482
LDI r11, 150
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
