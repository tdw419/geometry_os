; DESCRIPTION: Composite: Places a blue line segment connecting (372, 126) to (249, 40) then Sets a single green pixel at (287, 148) then Draws a white rectangle at (398, 178) with width 20 and height 76.
; PLAN: r0=372(x1), r1=126(y1), r2=249(x2), r3=40(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=287(x), r6=148(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=398(x), r11=178(y), r12=20(width), r13=76(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 372
LDI r1, 126
LDI r2, 249
LDI r3, 40
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 148
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 398
LDI r11, 178
LDI r12, 20
LDI r13, 76
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
