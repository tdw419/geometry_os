; DESCRIPTION: Composite: Draws a white circle centered at (95, 76) with radius 20 then Places a black line segment connecting (47, 210) to (353, 17).
; PLAN: r0=95(x), r1=76(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=47(x1), r6=210(y1), r7=353(x2), r8=17(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 95
LDI r1, 76
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 47
LDI r6, 210
LDI r7, 353
LDI r8, 17
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
