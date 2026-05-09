; DESCRIPTION: Composite: Draws a yellow rectangle at (381, 70) with width 104 and height 75 then Places a black dot at position (470, 140) then Places a yellow line segment connecting (371, 84) to (266, 119).
; PLAN: r0=381(x), r1=70(y), r2=104(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=470(x), r6=140(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=371(x1), r11=84(y1), r12=266(x2), r13=119(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 381
LDI r1, 70
LDI r2, 104
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 470
LDI r6, 140
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 371
LDI r11, 84
LDI r12, 266
LDI r13, 119
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
