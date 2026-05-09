; DESCRIPTION: Composite: Draws a orange rectangle at (275, 69) with width 42 and height 96 then Sets a single yellow pixel at (45, 120) then Places a purple line segment connecting (165, 100) to (331, 198).
; PLAN: r0=275(x), r1=69(y), r2=42(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=45(x), r6=120(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=165(x1), r11=100(y1), r12=331(x2), r13=198(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 275
LDI r1, 69
LDI r2, 42
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 120
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 165
LDI r11, 100
LDI r12, 331
LDI r13, 198
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
