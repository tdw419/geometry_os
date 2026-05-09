; DESCRIPTION: Composite: Draws a orange line from (453, 133) to (283, 231) then Creates a blue rectangular region at (191, 107) spanning 60 by 18 pixels then Places a white circle of radius 10 at center (210, 43).
; PLAN: r0=453(x1), r1=133(y1), r2=283(x2), r3=231(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=191(x), r6=107(y), r7=60(width), r8=18(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=210(x), r11=43(y), r12=10(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 453
LDI r1, 133
LDI r2, 283
LDI r3, 231
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 107
LDI r7, 60
LDI r8, 18
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 210
LDI r11, 43
LDI r12, 10
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
