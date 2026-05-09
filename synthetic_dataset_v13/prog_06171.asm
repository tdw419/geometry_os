; DESCRIPTION: Composite: Places a green dot at position (332, 10) then Draws a white circle centered at (400, 173) with radius 15 then Places a yellow line segment connecting (505, 131) to (170, 119).
; PLAN: r0=332(x), r1=10(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=400(x), r6=173(y), r7=15(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=505(x1), r11=131(y1), r12=170(x2), r13=119(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 332
LDI r1, 10
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 400
LDI r6, 173
LDI r7, 15
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 505
LDI r11, 131
LDI r12, 170
LDI r13, 119
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
