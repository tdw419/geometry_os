; DESCRIPTION: Composite: Renders a purple box of size 116x56 starting at (141, 93) then Renders a orange disk with center (312, 197) and radius 32 then Renders a green line between points (163, 222) and (338, 94).
; PLAN: r0=141(x), r1=93(y), r2=116(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=312(x), r6=197(y), r7=32(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=163(x1), r11=222(y1), r12=338(x2), r13=94(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 141
LDI r1, 93
LDI r2, 116
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 197
LDI r7, 32
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 163
LDI r11, 222
LDI r12, 338
LDI r13, 94
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
