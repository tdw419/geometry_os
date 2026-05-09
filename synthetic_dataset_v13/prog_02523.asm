; DESCRIPTION: Composite: Draws a magenta line from (290, 130) to (354, 193) then Creates a orange circular shape at (161, 178) with radius 61 then Creates a blue rectangular region at (194, 26) spanning 26 by 78 pixels.
; PLAN: r0=290(x1), r1=130(y1), r2=354(x2), r3=193(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=161(x), r6=178(y), r7=61(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=194(x), r11=26(y), r12=26(width), r13=78(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 290
LDI r1, 130
LDI r2, 354
LDI r3, 193
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 178
LDI r7, 61
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 194
LDI r11, 26
LDI r12, 26
LDI r13, 78
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
