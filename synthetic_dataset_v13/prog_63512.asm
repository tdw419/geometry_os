; DESCRIPTION: Composite: Draws a yellow circle centered at (398, 200) with radius 50 then Places a white line segment connecting (130, 200) to (452, 83).
; PLAN: r0=398(x), r1=200(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=130(x1), r6=200(y1), r7=452(x2), r8=83(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 398
LDI r1, 200
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 130
LDI r6, 200
LDI r7, 452
LDI r8, 83
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
