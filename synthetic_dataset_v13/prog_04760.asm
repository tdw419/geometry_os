; DESCRIPTION: Composite: Renders a yellow line between points (103, 223) and (472, 147) then Draws a green circle centered at (405, 170) with radius 80.
; PLAN: r0=103(x1), r1=223(y1), r2=472(x2), r3=147(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=405(x), r6=170(y), r7=80(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 103
LDI r1, 223
LDI r2, 472
LDI r3, 147
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 170
LDI r7, 80
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
