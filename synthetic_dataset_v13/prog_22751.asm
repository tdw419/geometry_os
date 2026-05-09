; DESCRIPTION: Composite: Places a purple 94x87 rectangle at position (344, 162) then Places a purple dot at position (40, 48) then Places a orange line segment connecting (509, 62) to (448, 107).
; PLAN: r0=344(x), r1=162(y), r2=94(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=40(x), r6=48(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=509(x1), r11=62(y1), r12=448(x2), r13=107(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 344
LDI r1, 162
LDI r2, 94
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 40
LDI r6, 48
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 509
LDI r11, 62
LDI r12, 448
LDI r13, 107
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
