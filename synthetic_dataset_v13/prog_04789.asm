; DESCRIPTION: Composite: Draws a orange circle centered at (273, 112) with radius 80 then Draws a white rectangle at (298, 138) with width 97 and height 83 then Draws a magenta line from (136, 243) to (452, 104).
; PLAN: r0=273(x), r1=112(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=298(x), r6=138(y), r7=97(width), r8=83(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=136(x1), r11=243(y1), r12=452(x2), r13=104(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 273
LDI r1, 112
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 298
LDI r6, 138
LDI r7, 97
LDI r8, 83
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 136
LDI r11, 243
LDI r12, 452
LDI r13, 104
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
