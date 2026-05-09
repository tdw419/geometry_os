; DESCRIPTION: Composite: Renders a blue line between points (298, 135) and (487, 0) then Creates a white rectangular region at (80, 94) spanning 106 by 109 pixels then Draws a white circle centered at (253, 116) with radius 37.
; PLAN: r0=298(x1), r1=135(y1), r2=487(x2), r3=0(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=80(x), r6=94(y), r7=106(width), r8=109(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=253(x), r11=116(y), r12=37(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 298
LDI r1, 135
LDI r2, 487
LDI r3, 0
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 80
LDI r6, 94
LDI r7, 106
LDI r8, 109
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 253
LDI r11, 116
LDI r12, 37
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
