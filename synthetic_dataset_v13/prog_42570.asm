; DESCRIPTION: Composite: Creates a magenta circular shape at (360, 74) with radius 69 then Renders a yellow line between points (332, 132) and (486, 126).
; PLAN: r0=360(x), r1=74(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=332(x1), r6=132(y1), r7=486(x2), r8=126(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 360
LDI r1, 74
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 332
LDI r6, 132
LDI r7, 486
LDI r8, 126
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
