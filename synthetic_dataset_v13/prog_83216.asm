; DESCRIPTION: Composite: Renders a white disk with center (143, 131) and radius 47 then Places a red line segment connecting (149, 220) to (318, 10).
; PLAN: r0=143(x), r1=131(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=149(x1), r6=220(y1), r7=318(x2), r8=10(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 143
LDI r1, 131
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 149
LDI r6, 220
LDI r7, 318
LDI r8, 10
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
