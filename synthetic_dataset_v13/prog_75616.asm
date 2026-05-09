; DESCRIPTION: Composite: Renders a yellow line between points (272, 166) and (90, 189) then Creates a yellow circular shape at (447, 114) with radius 31 then Places a purple 27x107 rectangle at position (355, 74).
; PLAN: r0=272(x1), r1=166(y1), r2=90(x2), r3=189(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=447(x), r6=114(y), r7=31(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=355(x), r11=74(y), r12=27(width), r13=107(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 272
LDI r1, 166
LDI r2, 90
LDI r3, 189
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 447
LDI r6, 114
LDI r7, 31
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 355
LDI r11, 74
LDI r12, 27
LDI r13, 107
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
