; DESCRIPTION: Composite: Renders a purple disk with center (433, 153) and radius 44 then Draws a yellow line from (459, 104) to (132, 220) then Renders a purple box of size 79x26 starting at (306, 162).
; PLAN: r0=433(x), r1=153(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=459(x1), r6=104(y1), r7=132(x2), r8=220(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=306(x), r11=162(y), r12=79(width), r13=26(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 433
LDI r1, 153
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 459
LDI r6, 104
LDI r7, 132
LDI r8, 220
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 306
LDI r11, 162
LDI r12, 79
LDI r13, 26
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
