; DESCRIPTION: Composite: Sets a single blue pixel at (254, 240) then Draws a blue circle centered at (439, 38) with radius 20 then Draws a orange line from (360, 29) to (274, 1).
; PLAN: r0=254(x), r1=240(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=439(x), r6=38(y), r7=20(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=360(x1), r11=29(y1), r12=274(x2), r13=1(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 254
LDI r1, 240
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 439
LDI r6, 38
LDI r7, 20
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 360
LDI r11, 29
LDI r12, 274
LDI r13, 1
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
