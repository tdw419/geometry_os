; DESCRIPTION: Composite: Places a green line segment connecting (229, 196) to (151, 79) then Draws a white circle centered at (268, 136) with radius 60 then Renders a green box of size 23x104 starting at (169, 57).
; PLAN: r0=229(x1), r1=196(y1), r2=151(x2), r3=79(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=268(x), r6=136(y), r7=60(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=169(x), r11=57(y), r12=23(width), r13=104(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 229
LDI r1, 196
LDI r2, 151
LDI r3, 79
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 268
LDI r6, 136
LDI r7, 60
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 169
LDI r11, 57
LDI r12, 23
LDI r13, 104
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
