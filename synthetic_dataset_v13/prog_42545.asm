; DESCRIPTION: Composite: Draws a magenta line from (300, 85) to (363, 6) then Places a green 77x60 rectangle at position (350, 25) then Creates a white circular shape at (300, 159) with radius 62.
; PLAN: r0=300(x1), r1=85(y1), r2=363(x2), r3=6(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=350(x), r6=25(y), r7=77(width), r8=60(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=300(x), r11=159(y), r12=62(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 300
LDI r1, 85
LDI r2, 363
LDI r3, 6
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 25
LDI r7, 77
LDI r8, 60
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 300
LDI r11, 159
LDI r12, 62
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
