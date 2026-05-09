; DESCRIPTION: Composite: Renders a red line between points (469, 204) and (374, 181) then Creates a yellow circular shape at (137, 125) with radius 58.
; PLAN: r0=469(x1), r1=204(y1), r2=374(x2), r3=181(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=137(x), r6=125(y), r7=58(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 469
LDI r1, 204
LDI r2, 374
LDI r3, 181
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 125
LDI r7, 58
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
