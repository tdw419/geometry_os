; DESCRIPTION: Composite: Places a black line segment connecting (47, 172) to (427, 213) then Creates a orange circular shape at (474, 215) with radius 36 then Sets a single yellow pixel at (67, 113).
; PLAN: r0=47(x1), r1=172(y1), r2=427(x2), r3=213(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=474(x), r6=215(y), r7=36(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=67(x), r11=113(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 47
LDI r1, 172
LDI r2, 427
LDI r3, 213
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 474
LDI r6, 215
LDI r7, 36
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 67
LDI r11, 113
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
