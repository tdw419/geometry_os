; DESCRIPTION: Composite: Sets a single red pixel at (180, 87) then Draws a cyan circle centered at (221, 139) with radius 59 then Places a black line segment connecting (336, 110) to (369, 203).
; PLAN: r0=180(x), r1=87(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=221(x), r6=139(y), r7=59(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=336(x1), r11=110(y1), r12=369(x2), r13=203(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 180
LDI r1, 87
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 221
LDI r6, 139
LDI r7, 59
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 336
LDI r11, 110
LDI r12, 369
LDI r13, 203
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
