; DESCRIPTION: Composite: Draws a green line from (464, 83) to (83, 126) then Creates a magenta rectangular region at (312, 196) spanning 17 by 42 pixels then Places a blue circle of radius 34 at center (371, 170).
; PLAN: r0=464(x1), r1=83(y1), r2=83(x2), r3=126(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=312(x), r6=196(y), r7=17(width), r8=42(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=371(x), r11=170(y), r12=34(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 464
LDI r1, 83
LDI r2, 83
LDI r3, 126
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 196
LDI r7, 17
LDI r8, 42
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 371
LDI r11, 170
LDI r12, 34
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
