; DESCRIPTION: Composite: Places a yellow dot at position (369, 124) then Creates a blue rectangular region at (71, 61) spanning 97 by 60 pixels then Draws a purple line from (394, 6) to (430, 214).
; PLAN: r0=369(x), r1=124(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=71(x), r6=61(y), r7=97(width), r8=60(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=394(x1), r11=6(y1), r12=430(x2), r13=214(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 369
LDI r1, 124
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 71
LDI r6, 61
LDI r7, 97
LDI r8, 60
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 394
LDI r11, 6
LDI r12, 430
LDI r13, 214
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
