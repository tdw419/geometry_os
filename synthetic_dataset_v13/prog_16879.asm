; DESCRIPTION: Composite: Sets a single green pixel at (57, 170) then Renders a yellow line between points (75, 217) and (317, 36) then Creates a orange rectangular region at (105, 111) spanning 119 by 67 pixels.
; PLAN: r0=57(x), r1=170(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=75(x1), r6=217(y1), r7=317(x2), r8=36(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=105(x), r11=111(y), r12=119(width), r13=67(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 57
LDI r1, 170
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 75
LDI r6, 217
LDI r7, 317
LDI r8, 36
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 105
LDI r11, 111
LDI r12, 119
LDI r13, 67
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
