; DESCRIPTION: Composite: Renders a white disk with center (173, 216) and radius 37 then Sets a single black pixel at (312, 230) then Draws a red line from (181, 39) to (482, 77).
; PLAN: r0=173(x), r1=216(y), r2=37(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=312(x), r6=230(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=181(x1), r11=39(y1), r12=482(x2), r13=77(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 173
LDI r1, 216
LDI r2, 37
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 312
LDI r6, 230
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 181
LDI r11, 39
LDI r12, 482
LDI r13, 77
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
