; DESCRIPTION: Composite: Sets a single red pixel at (364, 187) then Draws a orange rectangle at (216, 154) with width 91 and height 72 then Renders a blue line between points (373, 91) and (423, 234).
; PLAN: r0=364(x), r1=187(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=216(x), r6=154(y), r7=91(width), r8=72(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=373(x1), r11=91(y1), r12=423(x2), r13=234(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 364
LDI r1, 187
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 216
LDI r6, 154
LDI r7, 91
LDI r8, 72
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 373
LDI r11, 91
LDI r12, 423
LDI r13, 234
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
