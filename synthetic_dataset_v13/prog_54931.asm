; DESCRIPTION: Composite: Places a white circle of radius 73 at center (122, 127) then Renders a red box of size 86x13 starting at (166, 72) then Draws a purple line from (348, 3) to (331, 158).
; PLAN: r0=122(x), r1=127(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=166(x), r6=72(y), r7=86(width), r8=13(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=348(x1), r11=3(y1), r12=331(x2), r13=158(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 122
LDI r1, 127
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 166
LDI r6, 72
LDI r7, 86
LDI r8, 13
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 348
LDI r11, 3
LDI r12, 331
LDI r13, 158
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
