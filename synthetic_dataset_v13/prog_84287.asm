; DESCRIPTION: Composite: Renders a white line between points (388, 170) and (510, 214) then Creates a green rectangular region at (428, 88) spanning 15 by 77 pixels then Places a yellow circle of radius 50 at center (374, 139).
; PLAN: r0=388(x1), r1=170(y1), r2=510(x2), r3=214(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=428(x), r6=88(y), r7=15(width), r8=77(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=374(x), r11=139(y), r12=50(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 388
LDI r1, 170
LDI r2, 510
LDI r3, 214
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 428
LDI r6, 88
LDI r7, 15
LDI r8, 77
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 374
LDI r11, 139
LDI r12, 50
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
