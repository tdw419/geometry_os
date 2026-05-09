; DESCRIPTION: Composite: Creates a black rectangular region at (29, 50) spanning 75 by 80 pixels then Renders a orange disk with center (303, 136) and radius 51 then Renders a green line between points (247, 27) and (271, 144).
; PLAN: r0=29(x), r1=50(y), r2=75(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=303(x), r6=136(y), r7=51(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=247(x1), r11=27(y1), r12=271(x2), r13=144(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 29
LDI r1, 50
LDI r2, 75
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 136
LDI r7, 51
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 247
LDI r11, 27
LDI r12, 271
LDI r13, 144
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
