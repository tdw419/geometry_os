; DESCRIPTION: Composite: Creates a blue circular shape at (317, 182) with radius 47 then Places a green line segment connecting (165, 224) to (161, 201).
; PLAN: r0=317(x), r1=182(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=165(x1), r6=224(y1), r7=161(x2), r8=201(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 317
LDI r1, 182
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 165
LDI r6, 224
LDI r7, 161
LDI r8, 201
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
