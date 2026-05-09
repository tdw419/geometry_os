; DESCRIPTION: Composite: Draws a magenta line from (1, 109) to (73, 33) then Creates a green circular shape at (83, 47) with radius 32 then Creates a blue rectangular region at (430, 37) spanning 81 by 104 pixels.
; PLAN: r0=1(x1), r1=109(y1), r2=73(x2), r3=33(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=83(x), r6=47(y), r7=32(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=430(x), r11=37(y), r12=81(width), r13=104(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 1
LDI r1, 109
LDI r2, 73
LDI r3, 33
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 47
LDI r7, 32
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 430
LDI r11, 37
LDI r12, 81
LDI r13, 104
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
