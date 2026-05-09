; DESCRIPTION: Composite: Draws a red rectangle at (251, 75) with width 74 and height 87 then Places a yellow dot at position (250, 253) then Places a purple line segment connecting (37, 148) to (22, 58).
; PLAN: r0=251(x), r1=75(y), r2=74(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=250(x), r6=253(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=37(x1), r11=148(y1), r12=22(x2), r13=58(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 251
LDI r1, 75
LDI r2, 74
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 250
LDI r6, 253
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 37
LDI r11, 148
LDI r12, 22
LDI r13, 58
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
