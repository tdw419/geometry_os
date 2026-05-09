; DESCRIPTION: Composite: Places a green dot at position (428, 192) then Renders a purple disk with center (169, 217) and radius 11 then Draws a yellow line from (500, 223) to (17, 180).
; PLAN: r0=428(x), r1=192(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=169(x), r6=217(y), r7=11(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=500(x1), r11=223(y1), r12=17(x2), r13=180(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 428
LDI r1, 192
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 169
LDI r6, 217
LDI r7, 11
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 500
LDI r11, 223
LDI r12, 17
LDI r13, 180
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
