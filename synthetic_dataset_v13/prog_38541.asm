; DESCRIPTION: Composite: Renders a purple line between points (194, 156) and (493, 188) then Creates a yellow circular shape at (80, 143) with radius 71 then Places a orange 56x12 rectangle at position (434, 140).
; PLAN: r0=194(x1), r1=156(y1), r2=493(x2), r3=188(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=80(x), r6=143(y), r7=71(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=434(x), r11=140(y), r12=56(width), r13=12(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 194
LDI r1, 156
LDI r2, 493
LDI r3, 188
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 80
LDI r6, 143
LDI r7, 71
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 434
LDI r11, 140
LDI r12, 56
LDI r13, 12
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
