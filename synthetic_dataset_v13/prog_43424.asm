; DESCRIPTION: Composite: Renders a orange disk with center (225, 61) and radius 26 then Draws a orange line from (137, 179) to (428, 192) then Renders a purple box of size 10x109 starting at (124, 32).
; PLAN: r0=225(x), r1=61(y), r2=26(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=137(x1), r6=179(y1), r7=428(x2), r8=192(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=124(x), r11=32(y), r12=10(width), r13=109(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 225
LDI r1, 61
LDI r2, 26
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 137
LDI r6, 179
LDI r7, 428
LDI r8, 192
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 124
LDI r11, 32
LDI r12, 10
LDI r13, 109
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
