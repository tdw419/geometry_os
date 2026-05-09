; DESCRIPTION: Composite: Renders a yellow line between points (272, 75) and (207, 59) then Creates a yellow circular shape at (305, 72) with radius 54 then Creates a black rectangular region at (174, 130) spanning 115 by 82 pixels.
; PLAN: r0=272(x1), r1=75(y1), r2=207(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=305(x), r6=72(y), r7=54(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=174(x), r11=130(y), r12=115(width), r13=82(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 272
LDI r1, 75
LDI r2, 207
LDI r3, 59
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 305
LDI r6, 72
LDI r7, 54
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 174
LDI r11, 130
LDI r12, 115
LDI r13, 82
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
