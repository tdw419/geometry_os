; DESCRIPTION: Composite: Renders a magenta line between points (207, 20) and (345, 119) then Renders a magenta disk with center (398, 130) and radius 35 then Creates a blue rectangular region at (344, 13) spanning 112 by 45 pixels.
; PLAN: r0=207(x1), r1=20(y1), r2=345(x2), r3=119(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=398(x), r6=130(y), r7=35(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=344(x), r11=13(y), r12=112(width), r13=45(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 207
LDI r1, 20
LDI r2, 345
LDI r3, 119
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 398
LDI r6, 130
LDI r7, 35
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 344
LDI r11, 13
LDI r12, 112
LDI r13, 45
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
