; DESCRIPTION: Composite: Places a orange dot at position (8, 201) then Draws a yellow line from (361, 161) to (330, 61) then Places a purple 103x17 rectangle at position (244, 155).
; PLAN: r0=8(x), r1=201(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=361(x1), r6=161(y1), r7=330(x2), r8=61(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=244(x), r11=155(y), r12=103(width), r13=17(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 8
LDI r1, 201
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 361
LDI r6, 161
LDI r7, 330
LDI r8, 61
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 244
LDI r11, 155
LDI r12, 103
LDI r13, 17
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
