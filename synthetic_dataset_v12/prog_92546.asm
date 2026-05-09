; DESCRIPTION: Composite: Renders a orange line between points (36, 158) and (37, 156) then Places a blue circle of radius 27 at center (117, 62).
; PLAN: r0=36(x1), r1=158(y1), r2=37(x2), r3=156(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=117(x), r6=62(y), r7=27(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 36
LDI r1, 158
LDI r2, 37
LDI r3, 156
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 62
LDI r7, 27
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
