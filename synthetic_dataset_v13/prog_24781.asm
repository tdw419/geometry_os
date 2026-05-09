; DESCRIPTION: Composite: Renders a yellow line between points (397, 48) and (377, 11) then Creates a white circular shape at (133, 26) with radius 25.
; PLAN: r0=397(x1), r1=48(y1), r2=377(x2), r3=11(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=133(x), r6=26(y), r7=25(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 397
LDI r1, 48
LDI r2, 377
LDI r3, 11
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 133
LDI r6, 26
LDI r7, 25
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
