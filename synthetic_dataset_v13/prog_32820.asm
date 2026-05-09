; DESCRIPTION: Composite: Places a red line segment connecting (24, 194) to (387, 85) then Renders a black disk with center (336, 104) and radius 61.
; PLAN: r0=24(x1), r1=194(y1), r2=387(x2), r3=85(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=336(x), r6=104(y), r7=61(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 24
LDI r1, 194
LDI r2, 387
LDI r3, 85
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 104
LDI r7, 61
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
