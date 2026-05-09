; DESCRIPTION: Composite: Renders a black disk with center (364, 54) and radius 54 then Draws a black line from (136, 167) to (175, 112).
; PLAN: r0=364(x), r1=54(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=136(x1), r6=167(y1), r7=175(x2), r8=112(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 364
LDI r1, 54
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 136
LDI r6, 167
LDI r7, 175
LDI r8, 112
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
