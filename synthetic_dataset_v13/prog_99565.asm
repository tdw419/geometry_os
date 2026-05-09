; DESCRIPTION: Composite: Creates a blue rectangular region at (175, 118) spanning 12 by 102 pixels then Renders a black line between points (350, 253) and (265, 47) then Draws a cyan circle centered at (422, 172) with radius 21.
; PLAN: r0=175(x), r1=118(y), r2=12(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=350(x1), r6=253(y1), r7=265(x2), r8=47(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=422(x), r11=172(y), r12=21(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 175
LDI r1, 118
LDI r2, 12
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 253
LDI r7, 265
LDI r8, 47
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 422
LDI r11, 172
LDI r12, 21
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
