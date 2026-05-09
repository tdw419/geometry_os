; DESCRIPTION: Composite: Creates a cyan circular shape at (178, 110) with radius 51 then Creates a yellow rectangular region at (320, 236) spanning 17 by 19 pixels then Draws a blue line from (348, 55) to (389, 160).
; PLAN: r0=178(x), r1=110(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=320(x), r6=236(y), r7=17(width), r8=19(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=348(x1), r11=55(y1), r12=389(x2), r13=160(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 178
LDI r1, 110
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 320
LDI r6, 236
LDI r7, 17
LDI r8, 19
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 348
LDI r11, 55
LDI r12, 389
LDI r13, 160
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
