; DESCRIPTION: Composite: Draws a orange line from (133, 69) to (464, 15) then Renders a yellow disk with center (425, 149) and radius 41 then Renders a orange box of size 85x94 starting at (290, 111).
; PLAN: r0=133(x1), r1=69(y1), r2=464(x2), r3=15(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=425(x), r6=149(y), r7=41(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=290(x), r11=111(y), r12=85(width), r13=94(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 133
LDI r1, 69
LDI r2, 464
LDI r3, 15
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 425
LDI r6, 149
LDI r7, 41
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 290
LDI r11, 111
LDI r12, 85
LDI r13, 94
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
