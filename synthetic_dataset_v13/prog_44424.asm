; DESCRIPTION: Composite: Renders a red disk with center (104, 80) and radius 49 then Places a yellow line segment connecting (321, 5) to (308, 90) then Draws a blue rectangle at (335, 69) with width 65 and height 108.
; PLAN: r0=104(x), r1=80(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=321(x1), r6=5(y1), r7=308(x2), r8=90(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=335(x), r11=69(y), r12=65(width), r13=108(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 104
LDI r1, 80
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 321
LDI r6, 5
LDI r7, 308
LDI r8, 90
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 335
LDI r11, 69
LDI r12, 65
LDI r13, 108
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
