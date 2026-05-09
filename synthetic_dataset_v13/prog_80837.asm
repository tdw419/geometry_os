; DESCRIPTION: Composite: Places a white line segment connecting (390, 206) to (254, 41) then Renders a orange box of size 20x45 starting at (266, 143) then Places a white dot at position (366, 206).
; PLAN: r0=390(x1), r1=206(y1), r2=254(x2), r3=41(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=266(x), r6=143(y), r7=20(width), r8=45(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=366(x), r11=206(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 390
LDI r1, 206
LDI r2, 254
LDI r3, 41
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 143
LDI r7, 20
LDI r8, 45
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 366
LDI r11, 206
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
