; DESCRIPTION: Composite: Renders a yellow line between points (326, 116) and (375, 74) then Creates a yellow circular shape at (264, 213) with radius 21.
; PLAN: r0=326(x1), r1=116(y1), r2=375(x2), r3=74(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=264(x), r6=213(y), r7=21(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 326
LDI r1, 116
LDI r2, 375
LDI r3, 74
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 264
LDI r6, 213
LDI r7, 21
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
