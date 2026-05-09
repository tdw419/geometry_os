; DESCRIPTION: Composite: Renders a purple line between points (378, 224) and (119, 38) then Draws a white circle centered at (277, 58) with radius 50.
; PLAN: r0=378(x1), r1=224(y1), r2=119(x2), r3=38(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=277(x), r6=58(y), r7=50(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 378
LDI r1, 224
LDI r2, 119
LDI r3, 38
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 58
LDI r7, 50
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
