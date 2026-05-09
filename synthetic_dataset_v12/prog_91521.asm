; DESCRIPTION: Composite: Draws a green circle centered at (169, 100) with radius 50 then Places a white line segment connecting (332, 65) to (279, 187).
; PLAN: r0=169(x), r1=100(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=332(x1), r6=65(y1), r7=279(x2), r8=187(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 169
LDI r1, 100
LDI r2, 50
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 332
LDI r6, 65
LDI r7, 279
LDI r8, 187
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
