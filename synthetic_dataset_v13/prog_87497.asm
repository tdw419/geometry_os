; DESCRIPTION: Composite: Renders a black disk with center (479, 126) and radius 12 then Renders a orange line between points (262, 84) and (432, 17).
; PLAN: r0=479(x), r1=126(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=262(x1), r6=84(y1), r7=432(x2), r8=17(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 479
LDI r1, 126
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 262
LDI r6, 84
LDI r7, 432
LDI r8, 17
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
