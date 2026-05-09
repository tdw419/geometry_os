; DESCRIPTION: Composite: Creates a orange rectangular region at (358, 11) spanning 11 by 29 pixels then Sets a single purple pixel at (373, 201) then Places a blue line segment connecting (238, 183) to (134, 111).
; PLAN: r0=358(x), r1=11(y), r2=11(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=373(x), r6=201(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=238(x1), r11=183(y1), r12=134(x2), r13=111(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 358
LDI r1, 11
LDI r2, 11
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 373
LDI r6, 201
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 238
LDI r11, 183
LDI r12, 134
LDI r13, 111
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
