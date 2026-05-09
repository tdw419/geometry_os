; DESCRIPTION: Composite: Creates a purple circular shape at (382, 116) with radius 26 then Renders a yellow line between points (83, 143) and (219, 153).
; PLAN: r0=382(x), r1=116(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=83(x1), r6=143(y1), r7=219(x2), r8=153(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 382
LDI r1, 116
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 83
LDI r6, 143
LDI r7, 219
LDI r8, 153
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
