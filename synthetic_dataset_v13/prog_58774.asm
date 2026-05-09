; DESCRIPTION: Composite: Sets a single green pixel at (355, 170) then Creates a purple rectangular region at (186, 88) spanning 44 by 57 pixels then Renders a orange line between points (93, 39) and (66, 127).
; PLAN: r0=355(x), r1=170(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=186(x), r6=88(y), r7=44(width), r8=57(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=93(x1), r11=39(y1), r12=66(x2), r13=127(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 355
LDI r1, 170
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 186
LDI r6, 88
LDI r7, 44
LDI r8, 57
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 93
LDI r11, 39
LDI r12, 66
LDI r13, 127
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
