; DESCRIPTION: Composite: Places a white line segment connecting (478, 116) to (466, 252) then Draws a cyan circle centered at (88, 167) with radius 21.
; PLAN: r0=478(x1), r1=116(y1), r2=466(x2), r3=252(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=88(x), r6=167(y), r7=21(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 478
LDI r1, 116
LDI r2, 466
LDI r3, 252
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 167
LDI r7, 21
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
