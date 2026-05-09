; DESCRIPTION: Composite: Renders a blue disk with center (340, 119) and radius 66 then Draws a blue rectangle at (334, 59) with width 106 and height 75 then Places a magenta line segment connecting (260, 112) to (350, 28).
; PLAN: r0=340(x), r1=119(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=334(x), r6=59(y), r7=106(width), r8=75(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=260(x1), r11=112(y1), r12=350(x2), r13=28(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 340
LDI r1, 119
LDI r2, 66
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 334
LDI r6, 59
LDI r7, 106
LDI r8, 75
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 260
LDI r11, 112
LDI r12, 350
LDI r13, 28
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
