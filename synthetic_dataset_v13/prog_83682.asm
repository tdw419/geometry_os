; DESCRIPTION: Composite: Places a red circle of radius 24 at center (140, 43) then Sets a single green pixel at (100, 118) then Places a green line segment connecting (443, 246) to (285, 59).
; PLAN: r0=140(x), r1=43(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=100(x), r6=118(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=443(x1), r11=246(y1), r12=285(x2), r13=59(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 140
LDI r1, 43
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 100
LDI r6, 118
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 443
LDI r11, 246
LDI r12, 285
LDI r13, 59
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
