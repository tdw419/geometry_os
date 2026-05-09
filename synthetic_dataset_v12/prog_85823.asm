; DESCRIPTION: Composite: Draws a yellow line from (16, 204) to (183, 196) then Creates a green rectangular region at (65, 210) spanning 32 by 33 pixels then Creates a black circular shape at (254, 193) with radius 16.
; PLAN: r0=16(x1), r1=204(y1), r2=183(x2), r3=196(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=65(x), r6=210(y), r7=32(width), r8=33(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=254(x), r11=193(y), r12=16(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 16
LDI r1, 204
LDI r2, 183
LDI r3, 196
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 210
LDI r7, 32
LDI r8, 33
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 254
LDI r11, 193
LDI r12, 16
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
