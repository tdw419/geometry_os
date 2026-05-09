; DESCRIPTION: Composite: Places a cyan line segment connecting (214, 20) to (336, 88) then Creates a cyan circular shape at (316, 89) with radius 14.
; PLAN: r0=214(x1), r1=20(y1), r2=336(x2), r3=88(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=316(x), r6=89(y), r7=14(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 214
LDI r1, 20
LDI r2, 336
LDI r3, 88
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 89
LDI r7, 14
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
