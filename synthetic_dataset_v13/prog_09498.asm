; DESCRIPTION: Composite: Sets a single black pixel at (504, 61) then Places a yellow line segment connecting (180, 149) to (454, 56) then Draws a white circle centered at (176, 43) with radius 24.
; PLAN: r0=504(x), r1=61(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=180(x1), r6=149(y1), r7=454(x2), r8=56(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=176(x), r11=43(y), r12=24(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 504
LDI r1, 61
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 180
LDI r6, 149
LDI r7, 454
LDI r8, 56
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 176
LDI r11, 43
LDI r12, 24
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
