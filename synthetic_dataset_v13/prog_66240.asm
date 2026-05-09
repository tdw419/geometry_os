; DESCRIPTION: Composite: Creates a white circular shape at (71, 184) with radius 60 then Places a red line segment connecting (124, 113) to (417, 178) then Draws a purple rectangle at (277, 188) with width 78 and height 23.
; PLAN: r0=71(x), r1=184(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=124(x1), r6=113(y1), r7=417(x2), r8=178(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=277(x), r11=188(y), r12=78(width), r13=23(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 71
LDI r1, 184
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 124
LDI r6, 113
LDI r7, 417
LDI r8, 178
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 277
LDI r11, 188
LDI r12, 78
LDI r13, 23
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
