; DESCRIPTION: Composite: Renders a orange box of size 51x76 starting at (325, 83) then Places a white line segment connecting (457, 154) to (480, 3) then Renders a purple disk with center (273, 96) and radius 66.
; PLAN: r0=325(x), r1=83(y), r2=51(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=457(x1), r6=154(y1), r7=480(x2), r8=3(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=273(x), r11=96(y), r12=66(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 325
LDI r1, 83
LDI r2, 51
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 457
LDI r6, 154
LDI r7, 480
LDI r8, 3
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 273
LDI r11, 96
LDI r12, 66
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
