; DESCRIPTION: Composite: Places a orange line segment connecting (497, 205) to (434, 84) then Sets a single yellow pixel at (415, 42) then Renders a red box of size 46x72 starting at (49, 149).
; PLAN: r0=497(x1), r1=205(y1), r2=434(x2), r3=84(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=415(x), r6=42(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=49(x), r11=149(y), r12=46(width), r13=72(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 497
LDI r1, 205
LDI r2, 434
LDI r3, 84
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 42
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 49
LDI r11, 149
LDI r12, 46
LDI r13, 72
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
