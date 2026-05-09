; DESCRIPTION: Composite: Places a white dot at position (46, 224) then Places a white line segment connecting (97, 136) to (503, 203) then Draws a cyan circle centered at (260, 217) with radius 33.
; PLAN: r0=46(x), r1=224(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=97(x1), r6=136(y1), r7=503(x2), r8=203(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=260(x), r11=217(y), r12=33(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 46
LDI r1, 224
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 97
LDI r6, 136
LDI r7, 503
LDI r8, 203
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 260
LDI r11, 217
LDI r12, 33
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
