; DESCRIPTION: Composite: Places a black line segment connecting (306, 202) to (8, 255) then Creates a green circular shape at (406, 112) with radius 64 then Creates a white rectangular region at (381, 193) spanning 57 by 45 pixels.
; PLAN: r0=306(x1), r1=202(y1), r2=8(x2), r3=255(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=406(x), r6=112(y), r7=64(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=381(x), r11=193(y), r12=57(width), r13=45(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 306
LDI r1, 202
LDI r2, 8
LDI r3, 255
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 112
LDI r7, 64
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 381
LDI r11, 193
LDI r12, 57
LDI r13, 45
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
