; DESCRIPTION: Composite: Places a red line segment connecting (352, 198) to (335, 222) then Creates a blue circular shape at (277, 193) with radius 22 then Sets a single orange pixel at (262, 147).
; PLAN: r0=352(x1), r1=198(y1), r2=335(x2), r3=222(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=277(x), r6=193(y), r7=22(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=262(x), r11=147(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 352
LDI r1, 198
LDI r2, 335
LDI r3, 222
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 193
LDI r7, 22
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 262
LDI r11, 147
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
