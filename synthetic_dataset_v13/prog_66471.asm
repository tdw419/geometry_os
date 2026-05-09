; DESCRIPTION: Composite: Places a black line segment connecting (175, 90) to (70, 179) then Places a black circle of radius 76 at center (184, 92).
; PLAN: r0=175(x1), r1=90(y1), r2=70(x2), r3=179(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=184(x), r6=92(y), r7=76(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 175
LDI r1, 90
LDI r2, 70
LDI r3, 179
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 92
LDI r7, 76
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
