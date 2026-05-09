; DESCRIPTION: Composite: Renders a green box of size 104x110 starting at (309, 42) then Places a orange line segment connecting (243, 160) to (60, 152) then Draws a orange circle centered at (154, 149) with radius 62.
; PLAN: r0=309(x), r1=42(y), r2=104(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=243(x1), r6=160(y1), r7=60(x2), r8=152(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=154(x), r11=149(y), r12=62(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 309
LDI r1, 42
LDI r2, 104
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 160
LDI r7, 60
LDI r8, 152
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 154
LDI r11, 149
LDI r12, 62
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
