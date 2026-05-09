; DESCRIPTION: Composite: Places a red circle of radius 36 at center (140, 48) then Creates a green rectangular region at (285, 77) spanning 41 by 68 pixels then Places a blue line segment connecting (416, 87) to (405, 217).
; PLAN: r0=140(x), r1=48(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=285(x), r6=77(y), r7=41(width), r8=68(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=416(x1), r11=87(y1), r12=405(x2), r13=217(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 140
LDI r1, 48
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 285
LDI r6, 77
LDI r7, 41
LDI r8, 68
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 416
LDI r11, 87
LDI r12, 405
LDI r13, 217
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
