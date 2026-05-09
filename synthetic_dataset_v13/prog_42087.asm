; DESCRIPTION: Composite: Draws a black circle centered at (195, 69) with radius 17 then Renders a red line between points (179, 63) and (348, 22) then Renders a orange box of size 83x39 starting at (400, 213).
; PLAN: r0=195(x), r1=69(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=179(x1), r6=63(y1), r7=348(x2), r8=22(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=400(x), r11=213(y), r12=83(width), r13=39(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 195
LDI r1, 69
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 179
LDI r6, 63
LDI r7, 348
LDI r8, 22
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 400
LDI r11, 213
LDI r12, 83
LDI r13, 39
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
