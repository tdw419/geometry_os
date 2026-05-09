; DESCRIPTION: Composite: Draws a white line from (454, 207) to (492, 218) then Places a magenta 56x50 rectangle at position (335, 54) then Draws a blue circle centered at (76, 196) with radius 25.
; PLAN: r0=454(x1), r1=207(y1), r2=492(x2), r3=218(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=335(x), r6=54(y), r7=56(width), r8=50(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=76(x), r11=196(y), r12=25(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 454
LDI r1, 207
LDI r2, 492
LDI r3, 218
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 335
LDI r6, 54
LDI r7, 56
LDI r8, 50
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 76
LDI r11, 196
LDI r12, 25
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
