; DESCRIPTION: Composite: Renders a orange box of size 103x48 starting at (244, 65) then Places a orange line segment connecting (389, 51) to (249, 95) then Places a black circle of radius 53 at center (334, 150).
; PLAN: r0=244(x), r1=65(y), r2=103(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=389(x1), r6=51(y1), r7=249(x2), r8=95(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=334(x), r11=150(y), r12=53(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 244
LDI r1, 65
LDI r2, 103
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 389
LDI r6, 51
LDI r7, 249
LDI r8, 95
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 334
LDI r11, 150
LDI r12, 53
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
