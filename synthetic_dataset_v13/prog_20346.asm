; DESCRIPTION: Composite: Draws a white line from (147, 34) to (103, 153) then Creates a yellow rectangular region at (33, 193) spanning 102 by 50 pixels then Renders a red disk with center (328, 145) and radius 47.
; PLAN: r0=147(x1), r1=34(y1), r2=103(x2), r3=153(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=33(x), r6=193(y), r7=102(width), r8=50(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=328(x), r11=145(y), r12=47(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 147
LDI r1, 34
LDI r2, 103
LDI r3, 153
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 33
LDI r6, 193
LDI r7, 102
LDI r8, 50
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 328
LDI r11, 145
LDI r12, 47
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
