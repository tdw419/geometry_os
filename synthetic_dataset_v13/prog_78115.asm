; DESCRIPTION: Composite: Renders a black line between points (284, 19) and (77, 59) then Creates a purple circular shape at (192, 55) with radius 40 then Creates a black rectangular region at (18, 48) spanning 11 by 109 pixels.
; PLAN: r0=284(x1), r1=19(y1), r2=77(x2), r3=59(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=192(x), r6=55(y), r7=40(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=18(x), r11=48(y), r12=11(width), r13=109(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 284
LDI r1, 19
LDI r2, 77
LDI r3, 59
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 192
LDI r6, 55
LDI r7, 40
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 18
LDI r11, 48
LDI r12, 11
LDI r13, 109
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
