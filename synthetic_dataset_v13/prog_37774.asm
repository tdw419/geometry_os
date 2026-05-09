; DESCRIPTION: Composite: Draws a orange rectangle at (344, 52) with width 68 and height 48 then Places a blue circle of radius 49 at center (461, 162) then Draws a black line from (398, 135) to (301, 31).
; PLAN: r0=344(x), r1=52(y), r2=68(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=461(x), r6=162(y), r7=49(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=398(x1), r11=135(y1), r12=301(x2), r13=31(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 344
LDI r1, 52
LDI r2, 68
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 461
LDI r6, 162
LDI r7, 49
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 398
LDI r11, 135
LDI r12, 301
LDI r13, 31
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
