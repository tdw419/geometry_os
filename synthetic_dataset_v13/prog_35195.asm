; DESCRIPTION: Composite: Sets a single blue pixel at (495, 3) then Draws a white circle centered at (261, 119) with radius 71 then Places a black line segment connecting (231, 209) to (400, 16).
; PLAN: r0=495(x), r1=3(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=261(x), r6=119(y), r7=71(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=231(x1), r11=209(y1), r12=400(x2), r13=16(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 495
LDI r1, 3
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 261
LDI r6, 119
LDI r7, 71
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 231
LDI r11, 209
LDI r12, 400
LDI r13, 16
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
