; DESCRIPTION: Composite: Renders a black disk with center (409, 41) and radius 19 then Renders a red line between points (18, 2) and (143, 157).
; PLAN: r0=409(x), r1=41(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=18(x1), r6=2(y1), r7=143(x2), r8=157(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 409
LDI r1, 41
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 18
LDI r6, 2
LDI r7, 143
LDI r8, 157
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
