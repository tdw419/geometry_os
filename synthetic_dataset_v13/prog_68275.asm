; DESCRIPTION: Composite: Places a green 25x84 rectangle at position (165, 52) then Draws a magenta line from (478, 206) to (448, 246) then Creates a cyan circular shape at (303, 189) with radius 55.
; PLAN: r0=165(x), r1=52(y), r2=25(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=478(x1), r6=206(y1), r7=448(x2), r8=246(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=303(x), r11=189(y), r12=55(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 165
LDI r1, 52
LDI r2, 25
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 478
LDI r6, 206
LDI r7, 448
LDI r8, 246
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 303
LDI r11, 189
LDI r12, 55
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
