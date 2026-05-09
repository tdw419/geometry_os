; DESCRIPTION: Composite: Places a blue circle of radius 25 at center (110, 72) then Places a red line segment connecting (456, 75) to (258, 120) then Draws a cyan rectangle at (386, 119) with width 54 and height 89.
; PLAN: r0=110(x), r1=72(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=456(x1), r6=75(y1), r7=258(x2), r8=120(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=386(x), r11=119(y), r12=54(width), r13=89(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 110
LDI r1, 72
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 456
LDI r6, 75
LDI r7, 258
LDI r8, 120
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 386
LDI r11, 119
LDI r12, 54
LDI r13, 89
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
