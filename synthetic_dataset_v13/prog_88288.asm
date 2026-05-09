; DESCRIPTION: Composite: Creates a purple circular shape at (194, 57) with radius 50 then Renders a red line between points (426, 239) and (297, 81).
; PLAN: r0=194(x), r1=57(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=426(x1), r6=239(y1), r7=297(x2), r8=81(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 194
LDI r1, 57
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 426
LDI r6, 239
LDI r7, 297
LDI r8, 81
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
