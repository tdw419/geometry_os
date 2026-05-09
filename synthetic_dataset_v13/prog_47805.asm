; DESCRIPTION: Composite: Renders a magenta line between points (224, 226) and (105, 105) then Creates a yellow circular shape at (74, 45) with radius 11 then Creates a red rectangular region at (321, 128) spanning 106 by 91 pixels.
; PLAN: r0=224(x1), r1=226(y1), r2=105(x2), r3=105(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=74(x), r6=45(y), r7=11(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=321(x), r11=128(y), r12=106(width), r13=91(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 224
LDI r1, 226
LDI r2, 105
LDI r3, 105
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 74
LDI r6, 45
LDI r7, 11
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 321
LDI r11, 128
LDI r12, 106
LDI r13, 91
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
