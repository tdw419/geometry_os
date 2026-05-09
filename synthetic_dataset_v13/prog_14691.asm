; DESCRIPTION: Composite: Renders a yellow box of size 55x37 starting at (295, 192) then Draws a orange line from (113, 179) to (229, 186) then Creates a white circular shape at (230, 153) with radius 80.
; PLAN: r0=295(x), r1=192(y), r2=55(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=113(x1), r6=179(y1), r7=229(x2), r8=186(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=230(x), r11=153(y), r12=80(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 295
LDI r1, 192
LDI r2, 55
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 179
LDI r7, 229
LDI r8, 186
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 230
LDI r11, 153
LDI r12, 80
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
