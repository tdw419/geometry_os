; DESCRIPTION: Composite: Draws a red line from (397, 219) to (50, 156) then Renders a orange disk with center (238, 46) and radius 13 then Draws a yellow rectangle at (154, 6) with width 79 and height 32.
; PLAN: r0=397(x1), r1=219(y1), r2=50(x2), r3=156(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=238(x), r6=46(y), r7=13(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=154(x), r11=6(y), r12=79(width), r13=32(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 397
LDI r1, 219
LDI r2, 50
LDI r3, 156
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 46
LDI r7, 13
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 154
LDI r11, 6
LDI r12, 79
LDI r13, 32
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
