; DESCRIPTION: Composite: Creates a purple circular shape at (267, 179) with radius 71 then Creates a orange rectangular region at (223, 152) spanning 39 by 65 pixels then Draws a purple line from (111, 201) to (429, 8).
; PLAN: r0=267(x), r1=179(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=223(x), r6=152(y), r7=39(width), r8=65(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=111(x1), r11=201(y1), r12=429(x2), r13=8(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 267
LDI r1, 179
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 223
LDI r6, 152
LDI r7, 39
LDI r8, 65
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 111
LDI r11, 201
LDI r12, 429
LDI r13, 8
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
