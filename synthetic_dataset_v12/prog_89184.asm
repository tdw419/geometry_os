; DESCRIPTION: Composite: Draws a black line from (118, 53) to (486, 233) then Places a cyan circle of radius 23 at center (37, 29) then Creates a green rectangular region at (249, 168) spanning 105 by 57 pixels.
; PLAN: r0=118(x1), r1=53(y1), r2=486(x2), r3=233(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=37(x), r6=29(y), r7=23(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=249(x), r11=168(y), r12=105(width), r13=57(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 118
LDI r1, 53
LDI r2, 486
LDI r3, 233
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 37
LDI r6, 29
LDI r7, 23
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 249
LDI r11, 168
LDI r12, 105
LDI r13, 57
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
