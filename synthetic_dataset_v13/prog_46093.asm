; DESCRIPTION: Composite: Creates a red circular shape at (292, 165) with radius 31 then Renders a blue line between points (471, 158) and (154, 163) then Creates a magenta rectangular region at (178, 97) spanning 91 by 77 pixels.
; PLAN: r0=292(x), r1=165(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=471(x1), r6=158(y1), r7=154(x2), r8=163(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=178(x), r11=97(y), r12=91(width), r13=77(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 292
LDI r1, 165
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 471
LDI r6, 158
LDI r7, 154
LDI r8, 163
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 178
LDI r11, 97
LDI r12, 91
LDI r13, 77
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
