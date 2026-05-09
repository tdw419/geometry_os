; DESCRIPTION: Composite: Draws a red circle centered at (260, 156) with radius 59 then Places a white line segment connecting (225, 68) to (70, 117) then Renders a blue box of size 64x99 starting at (404, 9).
; PLAN: r0=260(x), r1=156(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=225(x1), r6=68(y1), r7=70(x2), r8=117(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=404(x), r11=9(y), r12=64(width), r13=99(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 260
LDI r1, 156
LDI r2, 59
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 225
LDI r6, 68
LDI r7, 70
LDI r8, 117
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 404
LDI r11, 9
LDI r12, 64
LDI r13, 99
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
