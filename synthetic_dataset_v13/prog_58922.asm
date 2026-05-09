; DESCRIPTION: Composite: Places a orange circle of radius 30 at center (357, 37) then Draws a yellow line from (349, 98) to (352, 176) then Creates a black rectangular region at (126, 92) spanning 104 by 40 pixels.
; PLAN: r0=357(x), r1=37(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=349(x1), r6=98(y1), r7=352(x2), r8=176(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=126(x), r11=92(y), r12=104(width), r13=40(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 357
LDI r1, 37
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 349
LDI r6, 98
LDI r7, 352
LDI r8, 176
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 126
LDI r11, 92
LDI r12, 104
LDI r13, 40
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
