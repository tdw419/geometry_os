; DESCRIPTION: Composite: Creates a blue rectangular region at (347, 46) spanning 83 by 117 pixels then Creates a cyan circular shape at (345, 130) with radius 58 then Draws a red line from (5, 142) to (6, 152).
; PLAN: r0=347(x), r1=46(y), r2=83(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=345(x), r6=130(y), r7=58(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=5(x1), r11=142(y1), r12=6(x2), r13=152(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 347
LDI r1, 46
LDI r2, 83
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 130
LDI r7, 58
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 5
LDI r11, 142
LDI r12, 6
LDI r13, 152
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
