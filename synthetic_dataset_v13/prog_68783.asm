; DESCRIPTION: Composite: Draws a purple line from (394, 147) to (258, 233) then Draws a red rectangle at (102, 140) with width 39 and height 100 then Creates a red circular shape at (80, 185) with radius 70.
; PLAN: r0=394(x1), r1=147(y1), r2=258(x2), r3=233(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=102(x), r6=140(y), r7=39(width), r8=100(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=80(x), r11=185(y), r12=70(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 394
LDI r1, 147
LDI r2, 258
LDI r3, 233
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 140
LDI r7, 39
LDI r8, 100
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 80
LDI r11, 185
LDI r12, 70
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
