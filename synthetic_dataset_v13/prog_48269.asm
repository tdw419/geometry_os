; DESCRIPTION: Composite: Places a orange line segment connecting (404, 202) to (116, 172) then Creates a blue rectangular region at (19, 181) spanning 46 by 61 pixels then Places a yellow dot at position (384, 107).
; PLAN: r0=404(x1), r1=202(y1), r2=116(x2), r3=172(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=19(x), r6=181(y), r7=46(width), r8=61(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=384(x), r11=107(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 404
LDI r1, 202
LDI r2, 116
LDI r3, 172
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 19
LDI r6, 181
LDI r7, 46
LDI r8, 61
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 384
LDI r11, 107
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
