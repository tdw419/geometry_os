; DESCRIPTION: Composite: Renders a orange box of size 40x112 starting at (380, 55) then Draws a green line from (293, 123) to (429, 181) then Renders a blue disk with center (124, 183) and radius 41.
; PLAN: r0=380(x), r1=55(y), r2=40(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=293(x1), r6=123(y1), r7=429(x2), r8=181(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=124(x), r11=183(y), r12=41(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 380
LDI r1, 55
LDI r2, 40
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 123
LDI r7, 429
LDI r8, 181
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 124
LDI r11, 183
LDI r12, 41
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
