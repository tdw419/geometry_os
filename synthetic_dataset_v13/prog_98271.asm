; DESCRIPTION: Composite: Places a red line segment connecting (408, 147) to (46, 121) then Renders a orange disk with center (442, 64) and radius 30.
; PLAN: r0=408(x1), r1=147(y1), r2=46(x2), r3=121(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=442(x), r6=64(y), r7=30(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 408
LDI r1, 147
LDI r2, 46
LDI r3, 121
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 64
LDI r7, 30
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
