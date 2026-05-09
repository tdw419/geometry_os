; DESCRIPTION: Composite: Places a white 120x44 rectangle at position (102, 119) then Places a orange line segment connecting (308, 245) to (314, 20) then Places a red circle of radius 52 at center (438, 149).
; PLAN: r0=102(x), r1=119(y), r2=120(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=308(x1), r6=245(y1), r7=314(x2), r8=20(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=438(x), r11=149(y), r12=52(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 102
LDI r1, 119
LDI r2, 120
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 308
LDI r6, 245
LDI r7, 314
LDI r8, 20
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 438
LDI r11, 149
LDI r12, 52
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
