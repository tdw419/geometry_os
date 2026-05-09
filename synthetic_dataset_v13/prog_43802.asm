; DESCRIPTION: Composite: Places a white line segment connecting (296, 121) to (203, 184) then Renders a red disk with center (41, 70) and radius 40.
; PLAN: r0=296(x1), r1=121(y1), r2=203(x2), r3=184(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=41(x), r6=70(y), r7=40(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 296
LDI r1, 121
LDI r2, 203
LDI r3, 184
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 41
LDI r6, 70
LDI r7, 40
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
