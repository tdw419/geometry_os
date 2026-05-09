; DESCRIPTION: Composite: Creates a purple circular shape at (291, 168) with radius 73 then Sets a single red pixel at (5, 78) then Creates a blue rectangular region at (428, 118) spanning 52 by 80 pixels.
; PLAN: r0=291(x), r1=168(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=5(x), r6=78(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=428(x), r11=118(y), r12=52(width), r13=80(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 291
LDI r1, 168
LDI r2, 73
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 5
LDI r6, 78
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 428
LDI r11, 118
LDI r12, 52
LDI r13, 80
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
