; DESCRIPTION: Composite: Draws a purple line from (400, 85) to (105, 44) then Places a green dot at position (161, 76) then Places a green 44x76 rectangle at position (142, 117).
; PLAN: r0=400(x1), r1=85(y1), r2=105(x2), r3=44(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=161(x), r6=76(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=142(x), r11=117(y), r12=44(width), r13=76(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 400
LDI r1, 85
LDI r2, 105
LDI r3, 44
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 76
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 142
LDI r11, 117
LDI r12, 44
LDI r13, 76
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
