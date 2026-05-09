; DESCRIPTION: Composite: Renders a yellow disk with center (81, 196) and radius 41 then Draws a black line from (296, 141) to (204, 129).
; PLAN: r0=81(x), r1=196(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=296(x1), r6=141(y1), r7=204(x2), r8=129(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 81
LDI r1, 196
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 296
LDI r6, 141
LDI r7, 204
LDI r8, 129
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
