; DESCRIPTION: Composite: Draws a red line from (408, 209) to (102, 218) then Renders a yellow disk with center (288, 70) and radius 67 then Sets a single black pixel at (503, 145).
; PLAN: r0=408(x1), r1=209(y1), r2=102(x2), r3=218(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=288(x), r6=70(y), r7=67(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=503(x), r11=145(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 408
LDI r1, 209
LDI r2, 102
LDI r3, 218
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 288
LDI r6, 70
LDI r7, 67
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 503
LDI r11, 145
LDI r12, 0x000000
PSET r10, r11, r12
HALT
