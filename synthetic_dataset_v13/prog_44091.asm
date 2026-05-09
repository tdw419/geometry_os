; DESCRIPTION: Composite: Renders a purple disk with center (447, 196) and radius 11 then Renders a orange box of size 114x114 starting at (382, 40) then Renders a yellow line between points (472, 71) and (95, 112).
; PLAN: r0=447(x), r1=196(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=382(x), r6=40(y), r7=114(width), r8=114(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=472(x1), r11=71(y1), r12=95(x2), r13=112(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 447
LDI r1, 196
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 382
LDI r6, 40
LDI r7, 114
LDI r8, 114
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 472
LDI r11, 71
LDI r12, 95
LDI r13, 112
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
