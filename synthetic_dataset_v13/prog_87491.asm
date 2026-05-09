; DESCRIPTION: Composite: Creates a blue rectangular region at (32, 103) spanning 20 by 31 pixels then Creates a green circular shape at (253, 81) with radius 63 then Places a red line segment connecting (51, 14) to (47, 204).
; PLAN: r0=32(x), r1=103(y), r2=20(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=253(x), r6=81(y), r7=63(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=51(x1), r11=14(y1), r12=47(x2), r13=204(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 32
LDI r1, 103
LDI r2, 20
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 81
LDI r7, 63
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 51
LDI r11, 14
LDI r12, 47
LDI r13, 204
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
