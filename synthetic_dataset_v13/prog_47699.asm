; DESCRIPTION: Composite: Places a cyan line segment connecting (280, 178) to (251, 208) then Creates a orange circular shape at (453, 88) with radius 39 then Draws a blue rectangle at (29, 23) with width 12 and height 31.
; PLAN: r0=280(x1), r1=178(y1), r2=251(x2), r3=208(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=453(x), r6=88(y), r7=39(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=29(x), r11=23(y), r12=12(width), r13=31(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 280
LDI r1, 178
LDI r2, 251
LDI r3, 208
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 453
LDI r6, 88
LDI r7, 39
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 29
LDI r11, 23
LDI r12, 12
LDI r13, 31
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
