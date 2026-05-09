; DESCRIPTION: Composite: Places a purple 78x62 rectangle at position (34, 44) then Draws a white line from (329, 90) to (292, 225) then Places a orange circle of radius 10 at center (435, 39).
; PLAN: r0=34(x), r1=44(y), r2=78(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=329(x1), r6=90(y1), r7=292(x2), r8=225(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=435(x), r11=39(y), r12=10(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 34
LDI r1, 44
LDI r2, 78
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 90
LDI r7, 292
LDI r8, 225
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 435
LDI r11, 39
LDI r12, 10
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
