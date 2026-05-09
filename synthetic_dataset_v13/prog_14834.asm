; DESCRIPTION: Composite: Creates a magenta circular shape at (303, 158) with radius 72 then Places a purple line segment connecting (317, 178) to (95, 250).
; PLAN: r0=303(x), r1=158(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=317(x1), r6=178(y1), r7=95(x2), r8=250(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 303
LDI r1, 158
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 317
LDI r6, 178
LDI r7, 95
LDI r8, 250
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
