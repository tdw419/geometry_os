; DESCRIPTION: Composite: Renders a orange line between points (233, 173) and (7, 34) then Creates a blue circular shape at (440, 101) with radius 71.
; PLAN: r0=233(x1), r1=173(y1), r2=7(x2), r3=34(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=440(x), r6=101(y), r7=71(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 233
LDI r1, 173
LDI r2, 7
LDI r3, 34
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 440
LDI r6, 101
LDI r7, 71
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
