; DESCRIPTION: Composite: Renders a purple line between points (218, 35) and (491, 177) then Renders a red disk with center (283, 169) and radius 71 then Places a blue 111x101 rectangle at position (203, 24).
; PLAN: r0=218(x1), r1=35(y1), r2=491(x2), r3=177(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=283(x), r6=169(y), r7=71(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=203(x), r11=24(y), r12=111(width), r13=101(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 218
LDI r1, 35
LDI r2, 491
LDI r3, 177
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 283
LDI r6, 169
LDI r7, 71
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 203
LDI r11, 24
LDI r12, 111
LDI r13, 101
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
