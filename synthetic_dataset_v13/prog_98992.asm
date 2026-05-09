; DESCRIPTION: Composite: Renders a magenta disk with center (162, 106) and radius 33 then Renders a orange line between points (474, 248) and (179, 70).
; PLAN: r0=162(x), r1=106(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=474(x1), r6=248(y1), r7=179(x2), r8=70(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 162
LDI r1, 106
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 474
LDI r6, 248
LDI r7, 179
LDI r8, 70
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
