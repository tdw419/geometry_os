; DESCRIPTION: Composite: Places a black circle of radius 46 at center (232, 101) then Renders a green line between points (115, 25) and (179, 11).
; PLAN: r0=232(x), r1=101(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=115(x1), r6=25(y1), r7=179(x2), r8=11(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 232
LDI r1, 101
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 115
LDI r6, 25
LDI r7, 179
LDI r8, 11
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
