; DESCRIPTION: Composite: Places a cyan circle of radius 54 at center (427, 189) then Places a blue line segment connecting (118, 241) to (351, 202).
; PLAN: r0=427(x), r1=189(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=118(x1), r6=241(y1), r7=351(x2), r8=202(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 427
LDI r1, 189
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 118
LDI r6, 241
LDI r7, 351
LDI r8, 202
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
