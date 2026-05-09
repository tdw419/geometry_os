; DESCRIPTION: Composite: Creates a black circular shape at (221, 77) with radius 74 then Places a blue line segment connecting (376, 126) to (456, 205).
; PLAN: r0=221(x), r1=77(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=376(x1), r6=126(y1), r7=456(x2), r8=205(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 221
LDI r1, 77
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 376
LDI r6, 126
LDI r7, 456
LDI r8, 205
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
