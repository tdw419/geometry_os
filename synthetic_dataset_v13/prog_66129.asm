; DESCRIPTION: Composite: Sets a single purple pixel at (440, 142) then Places a purple line segment connecting (308, 129) to (305, 77) then Draws a yellow rectangle at (198, 55) with width 76 and height 109.
; PLAN: r0=440(x), r1=142(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=308(x1), r6=129(y1), r7=305(x2), r8=77(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=198(x), r11=55(y), r12=76(width), r13=109(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 440
LDI r1, 142
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 308
LDI r6, 129
LDI r7, 305
LDI r8, 77
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 198
LDI r11, 55
LDI r12, 76
LDI r13, 109
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
