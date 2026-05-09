; DESCRIPTION: Composite: Creates a blue circular shape at (184, 128) with radius 15 then Renders a green line between points (208, 120) and (344, 41).
; PLAN: r0=184(x), r1=128(y), r2=15(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=208(x1), r6=120(y1), r7=344(x2), r8=41(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 184
LDI r1, 128
LDI r2, 15
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 208
LDI r6, 120
LDI r7, 344
LDI r8, 41
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
