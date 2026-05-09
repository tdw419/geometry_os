; DESCRIPTION: Composite: Draws a blue line from (344, 190) to (495, 70) then Places a blue dot at position (450, 135) then Places a orange circle of radius 30 at center (125, 122).
; PLAN: r0=344(x1), r1=190(y1), r2=495(x2), r3=70(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=450(x), r6=135(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=125(x), r11=122(y), r12=30(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 344
LDI r1, 190
LDI r2, 495
LDI r3, 70
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 450
LDI r6, 135
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 125
LDI r11, 122
LDI r12, 30
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
