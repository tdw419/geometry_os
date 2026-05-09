; DESCRIPTION: Composite: Renders a orange line between points (369, 17) and (421, 66) then Creates a magenta rectangular region at (439, 130) spanning 71 by 62 pixels then Creates a orange circular shape at (406, 126) with radius 74.
; PLAN: r0=369(x1), r1=17(y1), r2=421(x2), r3=66(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=439(x), r6=130(y), r7=71(width), r8=62(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=406(x), r11=126(y), r12=74(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 369
LDI r1, 17
LDI r2, 421
LDI r3, 66
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 130
LDI r7, 71
LDI r8, 62
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 406
LDI r11, 126
LDI r12, 74
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
