; DESCRIPTION: Composite: Draws a purple line from (71, 134) to (155, 233) then Sets a single black pixel at (454, 161) then Creates a cyan rectangular region at (260, 111) spanning 59 by 78 pixels.
; PLAN: r0=71(x1), r1=134(y1), r2=155(x2), r3=233(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=454(x), r6=161(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=260(x), r11=111(y), r12=59(width), r13=78(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 71
LDI r1, 134
LDI r2, 155
LDI r3, 233
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 454
LDI r6, 161
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 260
LDI r11, 111
LDI r12, 59
LDI r13, 78
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
