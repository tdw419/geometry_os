; DESCRIPTION: Composite: Renders a cyan line between points (440, 147) and (141, 41) then Creates a yellow circular shape at (97, 103) with radius 39.
; PLAN: r0=440(x1), r1=147(y1), r2=141(x2), r3=41(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=97(x), r6=103(y), r7=39(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 440
LDI r1, 147
LDI r2, 141
LDI r3, 41
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 97
LDI r6, 103
LDI r7, 39
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
