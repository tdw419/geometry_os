; DESCRIPTION: Composite: Creates a white circular shape at (443, 233) with radius 11 then Places a purple line segment connecting (469, 74) to (369, 228) then Creates a yellow rectangular region at (362, 70) spanning 115 by 66 pixels.
; PLAN: r0=443(x), r1=233(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=469(x1), r6=74(y1), r7=369(x2), r8=228(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=362(x), r11=70(y), r12=115(width), r13=66(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 443
LDI r1, 233
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 469
LDI r6, 74
LDI r7, 369
LDI r8, 228
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 362
LDI r11, 70
LDI r12, 115
LDI r13, 66
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
