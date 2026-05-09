; DESCRIPTION: Composite: Sets a single orange pixel at (85, 186) then Draws a green line from (201, 86) to (506, 81) then Creates a orange rectangular region at (253, 118) spanning 113 by 107 pixels.
; PLAN: r0=85(x), r1=186(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=201(x1), r6=86(y1), r7=506(x2), r8=81(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=253(x), r11=118(y), r12=113(width), r13=107(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 85
LDI r1, 186
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 201
LDI r6, 86
LDI r7, 506
LDI r8, 81
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 253
LDI r11, 118
LDI r12, 113
LDI r13, 107
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
