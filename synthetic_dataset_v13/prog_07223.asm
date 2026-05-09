; DESCRIPTION: Composite: Creates a magenta circular shape at (275, 172) with radius 78 then Renders a yellow line between points (288, 115) and (182, 88).
; PLAN: r0=275(x), r1=172(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=288(x1), r6=115(y1), r7=182(x2), r8=88(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 275
LDI r1, 172
LDI r2, 78
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 288
LDI r6, 115
LDI r7, 182
LDI r8, 88
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
