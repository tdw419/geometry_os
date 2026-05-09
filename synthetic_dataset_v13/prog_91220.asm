; DESCRIPTION: Composite: Draws a blue circle centered at (321, 151) with radius 23 then Places a green line segment connecting (200, 15) to (152, 61) then Places a yellow 47x39 rectangle at position (350, 67).
; PLAN: r0=321(x), r1=151(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=200(x1), r6=15(y1), r7=152(x2), r8=61(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=350(x), r11=67(y), r12=47(width), r13=39(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 321
LDI r1, 151
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 200
LDI r6, 15
LDI r7, 152
LDI r8, 61
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 350
LDI r11, 67
LDI r12, 47
LDI r13, 39
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
