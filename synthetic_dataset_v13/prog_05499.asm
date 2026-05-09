; DESCRIPTION: Composite: Sets a single purple pixel at (256, 136) then Creates a blue rectangular region at (18, 38) spanning 104 by 21 pixels then Places a white line segment connecting (485, 83) to (181, 37).
; PLAN: r0=256(x), r1=136(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=18(x), r6=38(y), r7=104(width), r8=21(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=485(x1), r11=83(y1), r12=181(x2), r13=37(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 256
LDI r1, 136
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 18
LDI r6, 38
LDI r7, 104
LDI r8, 21
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 485
LDI r11, 83
LDI r12, 181
LDI r13, 37
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
