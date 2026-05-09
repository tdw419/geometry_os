; DESCRIPTION: Composite: Sets a single purple pixel at (301, 40) then Creates a blue rectangular region at (191, 45) spanning 57 by 39 pixels then Renders a yellow line between points (331, 165) and (40, 163).
; PLAN: r0=301(x), r1=40(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=191(x), r6=45(y), r7=57(width), r8=39(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=331(x1), r11=165(y1), r12=40(x2), r13=163(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 301
LDI r1, 40
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 191
LDI r6, 45
LDI r7, 57
LDI r8, 39
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 331
LDI r11, 165
LDI r12, 40
LDI r13, 163
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
