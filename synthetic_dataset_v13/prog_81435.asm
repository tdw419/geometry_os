; DESCRIPTION: Composite: Draws a green circle centered at (79, 83) with radius 57 then Places a blue line segment connecting (466, 150) to (238, 227) then Draws a white rectangle at (11, 212) with width 40 and height 37.
; PLAN: r0=79(x), r1=83(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=466(x1), r6=150(y1), r7=238(x2), r8=227(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=11(x), r11=212(y), r12=40(width), r13=37(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 79
LDI r1, 83
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 466
LDI r6, 150
LDI r7, 238
LDI r8, 227
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 11
LDI r11, 212
LDI r12, 40
LDI r13, 37
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
