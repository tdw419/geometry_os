; DESCRIPTION: Composite: Places a blue line segment connecting (160, 88) to (178, 249) then Draws a cyan rectangle at (183, 34) with width 61 and height 89 then Places a green circle of radius 25 at center (250, 102).
; PLAN: r0=160(x1), r1=88(y1), r2=178(x2), r3=249(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=183(x), r6=34(y), r7=61(width), r8=89(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=250(x), r11=102(y), r12=25(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 160
LDI r1, 88
LDI r2, 178
LDI r3, 249
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 183
LDI r6, 34
LDI r7, 61
LDI r8, 89
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 250
LDI r11, 102
LDI r12, 25
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
