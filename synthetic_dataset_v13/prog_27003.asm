; DESCRIPTION: Composite: Places a blue line segment connecting (165, 147) to (129, 134) then Places a orange dot at position (491, 117) then Creates a purple rectangular region at (65, 129) spanning 67 by 82 pixels.
; PLAN: r0=165(x1), r1=147(y1), r2=129(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=491(x), r6=117(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=65(x), r11=129(y), r12=67(width), r13=82(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 165
LDI r1, 147
LDI r2, 129
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 491
LDI r6, 117
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 65
LDI r11, 129
LDI r12, 67
LDI r13, 82
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
