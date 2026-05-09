; DESCRIPTION: Composite: Renders a orange disk with center (359, 80) and radius 47 then Draws a orange line from (414, 17) to (452, 178) then Places a blue 30x80 rectangle at position (433, 154).
; PLAN: r0=359(x), r1=80(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=414(x1), r6=17(y1), r7=452(x2), r8=178(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=433(x), r11=154(y), r12=30(width), r13=80(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 359
LDI r1, 80
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 414
LDI r6, 17
LDI r7, 452
LDI r8, 178
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 433
LDI r11, 154
LDI r12, 30
LDI r13, 80
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
