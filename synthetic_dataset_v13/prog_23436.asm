; DESCRIPTION: Composite: Creates a yellow circular shape at (235, 145) with radius 60 then Renders a yellow line between points (33, 182) and (193, 79) then Creates a blue rectangular region at (375, 9) spanning 20 by 48 pixels.
; PLAN: r0=235(x), r1=145(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=33(x1), r6=182(y1), r7=193(x2), r8=79(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=375(x), r11=9(y), r12=20(width), r13=48(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 235
LDI r1, 145
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 33
LDI r6, 182
LDI r7, 193
LDI r8, 79
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 375
LDI r11, 9
LDI r12, 20
LDI r13, 48
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
