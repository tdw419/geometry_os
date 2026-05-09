; DESCRIPTION: Composite: Sets a single purple pixel at (143, 100) then Creates a white rectangular region at (454, 206) spanning 43 by 14 pixels then Places a black line segment connecting (160, 21) to (216, 56).
; PLAN: r0=143(x), r1=100(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=454(x), r6=206(y), r7=43(width), r8=14(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=160(x1), r11=21(y1), r12=216(x2), r13=56(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 143
LDI r1, 100
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 454
LDI r6, 206
LDI r7, 43
LDI r8, 14
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 160
LDI r11, 21
LDI r12, 216
LDI r13, 56
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
