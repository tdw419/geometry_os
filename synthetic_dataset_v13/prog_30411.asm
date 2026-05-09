; DESCRIPTION: Composite: Draws a yellow line from (3, 219) to (211, 200) then Renders a purple disk with center (145, 60) and radius 38 then Places a magenta 46x92 rectangle at position (11, 58).
; PLAN: r0=3(x1), r1=219(y1), r2=211(x2), r3=200(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=145(x), r6=60(y), r7=38(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=11(x), r11=58(y), r12=46(width), r13=92(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 3
LDI r1, 219
LDI r2, 211
LDI r3, 200
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 60
LDI r7, 38
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 11
LDI r11, 58
LDI r12, 46
LDI r13, 92
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
