; DESCRIPTION: Composite: Renders a red line between points (80, 190) and (358, 99) then Renders a blue disk with center (368, 193) and radius 34 then Places a purple 17x92 rectangle at position (247, 52).
; PLAN: r0=80(x1), r1=190(y1), r2=358(x2), r3=99(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=368(x), r6=193(y), r7=34(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=247(x), r11=52(y), r12=17(width), r13=92(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 80
LDI r1, 190
LDI r2, 358
LDI r3, 99
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 193
LDI r7, 34
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 247
LDI r11, 52
LDI r12, 17
LDI r13, 92
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
