; DESCRIPTION: Composite: Renders a red box of size 47x108 starting at (325, 114) then Renders a red disk with center (227, 43) and radius 15 then Draws a purple line from (385, 92) to (473, 54).
; PLAN: r0=325(x), r1=114(y), r2=47(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=227(x), r6=43(y), r7=15(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=385(x1), r11=92(y1), r12=473(x2), r13=54(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 325
LDI r1, 114
LDI r2, 47
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 43
LDI r7, 15
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 385
LDI r11, 92
LDI r12, 473
LDI r13, 54
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
