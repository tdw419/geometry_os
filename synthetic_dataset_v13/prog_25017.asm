; DESCRIPTION: Composite: Places a blue line segment connecting (122, 27) to (413, 208) then Sets a single purple pixel at (128, 142) then Draws a white circle centered at (199, 76) with radius 48.
; PLAN: r0=122(x1), r1=27(y1), r2=413(x2), r3=208(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=128(x), r6=142(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=199(x), r11=76(y), r12=48(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 122
LDI r1, 27
LDI r2, 413
LDI r3, 208
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 128
LDI r6, 142
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 199
LDI r11, 76
LDI r12, 48
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
