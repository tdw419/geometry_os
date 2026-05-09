; DESCRIPTION: Composite: Draws a yellow rectangle at (36, 217) with width 72 and height 26 then Sets a single blue pixel at (333, 118) then Renders a white line between points (342, 47) and (264, 140).
; PLAN: r0=36(x), r1=217(y), r2=72(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=333(x), r6=118(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=342(x1), r11=47(y1), r12=264(x2), r13=140(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 36
LDI r1, 217
LDI r2, 72
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 333
LDI r6, 118
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 342
LDI r11, 47
LDI r12, 264
LDI r13, 140
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
