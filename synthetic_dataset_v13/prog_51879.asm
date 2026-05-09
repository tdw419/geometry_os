; DESCRIPTION: Composite: Renders a black disk with center (344, 171) and radius 53 then Renders a red line between points (87, 43) and (134, 25).
; PLAN: r0=344(x), r1=171(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=87(x1), r6=43(y1), r7=134(x2), r8=25(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 344
LDI r1, 171
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 87
LDI r6, 43
LDI r7, 134
LDI r8, 25
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
