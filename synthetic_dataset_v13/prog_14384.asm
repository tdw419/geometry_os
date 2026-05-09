; DESCRIPTION: Composite: Draws a red circle centered at (36, 217) with radius 33 then Renders a green line between points (41, 209) and (495, 20).
; PLAN: r0=36(x), r1=217(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=41(x1), r6=209(y1), r7=495(x2), r8=20(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 36
LDI r1, 217
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 41
LDI r6, 209
LDI r7, 495
LDI r8, 20
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
