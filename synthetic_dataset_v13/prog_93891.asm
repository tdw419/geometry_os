; DESCRIPTION: Composite: Renders a orange disk with center (179, 98) and radius 62 then Places a red line segment connecting (141, 65) to (323, 112) then Places a red 74x104 rectangle at position (149, 125).
; PLAN: r0=179(x), r1=98(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=141(x1), r6=65(y1), r7=323(x2), r8=112(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=149(x), r11=125(y), r12=74(width), r13=104(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 179
LDI r1, 98
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 141
LDI r6, 65
LDI r7, 323
LDI r8, 112
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 149
LDI r11, 125
LDI r12, 74
LDI r13, 104
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
