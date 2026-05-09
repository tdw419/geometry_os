; DESCRIPTION: Composite: Places a blue line segment connecting (178, 130) to (49, 209) then Creates a white circular shape at (261, 161) with radius 75 then Creates a magenta rectangular region at (174, 58) spanning 89 by 111 pixels.
; PLAN: r0=178(x1), r1=130(y1), r2=49(x2), r3=209(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=261(x), r6=161(y), r7=75(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=174(x), r11=58(y), r12=89(width), r13=111(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 178
LDI r1, 130
LDI r2, 49
LDI r3, 209
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 161
LDI r7, 75
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 174
LDI r11, 58
LDI r12, 89
LDI r13, 111
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
