; DESCRIPTION: Composite: Draws a blue circle centered at (303, 127) with radius 36 then Renders a cyan line between points (315, 229) and (354, 218) then Creates a green rectangular region at (216, 49) spanning 66 by 92 pixels.
; PLAN: r0=303(x), r1=127(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=315(x1), r6=229(y1), r7=354(x2), r8=218(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=216(x), r11=49(y), r12=66(width), r13=92(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 303
LDI r1, 127
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 315
LDI r6, 229
LDI r7, 354
LDI r8, 218
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 216
LDI r11, 49
LDI r12, 66
LDI r13, 92
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
