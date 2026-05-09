; DESCRIPTION: Composite: Places a black line segment connecting (214, 51) to (153, 47) then Creates a white rectangular region at (175, 235) spanning 92 by 17 pixels then Places a red circle of radius 37 at center (392, 65).
; PLAN: r0=214(x1), r1=51(y1), r2=153(x2), r3=47(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=175(x), r6=235(y), r7=92(width), r8=17(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=392(x), r11=65(y), r12=37(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 214
LDI r1, 51
LDI r2, 153
LDI r3, 47
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 235
LDI r7, 92
LDI r8, 17
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 392
LDI r11, 65
LDI r12, 37
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
