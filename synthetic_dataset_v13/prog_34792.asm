; DESCRIPTION: Composite: Draws a orange line from (465, 55) to (40, 86) then Places a white circle of radius 66 at center (360, 122).
; PLAN: r0=465(x1), r1=55(y1), r2=40(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=360(x), r6=122(y), r7=66(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 465
LDI r1, 55
LDI r2, 40
LDI r3, 86
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 360
LDI r6, 122
LDI r7, 66
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
