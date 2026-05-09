; DESCRIPTION: Composite: Renders a purple box of size 90x69 starting at (193, 8) then Draws a yellow circle centered at (389, 33) with radius 10 then Renders a orange line between points (465, 207) and (135, 79).
; PLAN: r0=193(x), r1=8(y), r2=90(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=389(x), r6=33(y), r7=10(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=465(x1), r11=207(y1), r12=135(x2), r13=79(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 193
LDI r1, 8
LDI r2, 90
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 389
LDI r6, 33
LDI r7, 10
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 465
LDI r11, 207
LDI r12, 135
LDI r13, 79
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
