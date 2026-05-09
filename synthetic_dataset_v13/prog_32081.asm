; DESCRIPTION: Composite: Places a orange circle of radius 45 at center (369, 205) then Places a red 65x47 rectangle at position (134, 48) then Draws a red line from (206, 1) to (364, 44).
; PLAN: r0=369(x), r1=205(y), r2=45(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=134(x), r6=48(y), r7=65(width), r8=47(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=206(x1), r11=1(y1), r12=364(x2), r13=44(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 369
LDI r1, 205
LDI r2, 45
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 134
LDI r6, 48
LDI r7, 65
LDI r8, 47
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 206
LDI r11, 1
LDI r12, 364
LDI r13, 44
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
