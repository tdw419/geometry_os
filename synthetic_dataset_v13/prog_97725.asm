; DESCRIPTION: Composite: Draws a white circle centered at (364, 163) with radius 19 then Sets a single magenta pixel at (432, 120) then Draws a magenta line from (279, 252) to (353, 207).
; PLAN: r0=364(x), r1=163(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=432(x), r6=120(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=279(x1), r11=252(y1), r12=353(x2), r13=207(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 364
LDI r1, 163
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 432
LDI r6, 120
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 279
LDI r11, 252
LDI r12, 353
LDI r13, 207
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
