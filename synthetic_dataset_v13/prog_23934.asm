; DESCRIPTION: Composite: Places a white circle of radius 19 at center (430, 219) then Renders a yellow line between points (159, 155) and (306, 120) then Renders a magenta box of size 66x56 starting at (217, 33).
; PLAN: r0=430(x), r1=219(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=159(x1), r6=155(y1), r7=306(x2), r8=120(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=217(x), r11=33(y), r12=66(width), r13=56(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 430
LDI r1, 219
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 159
LDI r6, 155
LDI r7, 306
LDI r8, 120
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 217
LDI r11, 33
LDI r12, 66
LDI r13, 56
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
