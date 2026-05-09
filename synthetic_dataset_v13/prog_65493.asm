; DESCRIPTION: Composite: Renders a white line between points (78, 160) and (202, 217) then Renders a black disk with center (339, 54) and radius 11.
; PLAN: r0=78(x1), r1=160(y1), r2=202(x2), r3=217(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=339(x), r6=54(y), r7=11(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 78
LDI r1, 160
LDI r2, 202
LDI r3, 217
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 339
LDI r6, 54
LDI r7, 11
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
