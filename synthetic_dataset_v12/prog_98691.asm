; DESCRIPTION: Composite: Creates a green circular shape at (170, 100) with radius 73 then Places a black line segment connecting (42, 14) to (379, 121).
; PLAN: r0=170(x), r1=100(y), r2=73(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=42(x1), r6=14(y1), r7=379(x2), r8=121(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 170
LDI r1, 100
LDI r2, 73
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 42
LDI r6, 14
LDI r7, 379
LDI r8, 121
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
