; DESCRIPTION: Composite: Renders a red box of size 100x87 starting at (172, 100) then Renders a red line between points (511, 102) and (202, 72) then Creates a magenta circular shape at (281, 125) with radius 78.
; PLAN: r0=172(x), r1=100(y), r2=100(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=511(x1), r6=102(y1), r7=202(x2), r8=72(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=281(x), r11=125(y), r12=78(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 172
LDI r1, 100
LDI r2, 100
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 511
LDI r6, 102
LDI r7, 202
LDI r8, 72
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 281
LDI r11, 125
LDI r12, 78
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
