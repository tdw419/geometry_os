; DESCRIPTION: Composite: Draws a orange line from (427, 154) to (33, 68) then Draws a red circle centered at (253, 173) with radius 53.
; PLAN: r0=427(x1), r1=154(y1), r2=33(x2), r3=68(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=253(x), r6=173(y), r7=53(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 427
LDI r1, 154
LDI r2, 33
LDI r3, 68
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 173
LDI r7, 53
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
