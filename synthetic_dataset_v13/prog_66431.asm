; DESCRIPTION: Composite: Renders a orange box of size 13x55 starting at (173, 110) then Sets a single white pixel at (41, 162) then Places a orange line segment connecting (404, 68) to (511, 74).
; PLAN: r0=173(x), r1=110(y), r2=13(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=41(x), r6=162(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=404(x1), r11=68(y1), r12=511(x2), r13=74(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 173
LDI r1, 110
LDI r2, 13
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 41
LDI r6, 162
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 404
LDI r11, 68
LDI r12, 511
LDI r13, 74
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
