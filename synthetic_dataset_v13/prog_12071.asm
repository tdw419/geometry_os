; DESCRIPTION: Composite: Renders a yellow line between points (173, 152) and (186, 227) then Creates a black circular shape at (191, 50) with radius 40 then Creates a blue rectangular region at (46, 2) spanning 24 by 93 pixels.
; PLAN: r0=173(x1), r1=152(y1), r2=186(x2), r3=227(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=191(x), r6=50(y), r7=40(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=46(x), r11=2(y), r12=24(width), r13=93(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 173
LDI r1, 152
LDI r2, 186
LDI r3, 227
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 50
LDI r7, 40
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 46
LDI r11, 2
LDI r12, 24
LDI r13, 93
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
