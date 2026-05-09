; DESCRIPTION: Composite: Draws a white circle centered at (318, 120) with radius 20 then Renders a yellow line between points (219, 30) and (303, 141).
; PLAN: r0=318(x), r1=120(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=219(x1), r6=30(y1), r7=303(x2), r8=141(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 318
LDI r1, 120
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 219
LDI r6, 30
LDI r7, 303
LDI r8, 141
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
