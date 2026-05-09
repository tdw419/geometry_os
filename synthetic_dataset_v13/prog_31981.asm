; DESCRIPTION: Composite: Creates a purple circular shape at (334, 202) with radius 46 then Draws a green rectangle at (133, 87) with width 26 and height 103 then Draws a green line from (331, 44) to (375, 97).
; PLAN: r0=334(x), r1=202(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=133(x), r6=87(y), r7=26(width), r8=103(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=331(x1), r11=44(y1), r12=375(x2), r13=97(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 334
LDI r1, 202
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 133
LDI r6, 87
LDI r7, 26
LDI r8, 103
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 331
LDI r11, 44
LDI r12, 375
LDI r13, 97
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
