; DESCRIPTION: Composite: Renders a cyan box of size 65x47 starting at (381, 142) then Places a cyan circle of radius 17 at center (151, 160) then Renders a cyan line between points (132, 78) and (476, 248).
; PLAN: r0=381(x), r1=142(y), r2=65(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=151(x), r6=160(y), r7=17(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=132(x1), r11=78(y1), r12=476(x2), r13=248(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 381
LDI r1, 142
LDI r2, 65
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 160
LDI r7, 17
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 132
LDI r11, 78
LDI r12, 476
LDI r13, 248
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
