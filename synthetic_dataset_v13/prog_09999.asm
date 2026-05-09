; DESCRIPTION: Composite: Places a green line segment connecting (437, 88) to (121, 235) then Creates a green circular shape at (45, 73) with radius 43.
; PLAN: r0=437(x1), r1=88(y1), r2=121(x2), r3=235(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=45(x), r6=73(y), r7=43(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 437
LDI r1, 88
LDI r2, 121
LDI r3, 235
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 73
LDI r7, 43
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
