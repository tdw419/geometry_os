; DESCRIPTION: Composite: Creates a yellow circular shape at (71, 171) with radius 61 then Places a black line segment connecting (47, 240) to (133, 254).
; PLAN: r0=71(x), r1=171(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=47(x1), r6=240(y1), r7=133(x2), r8=254(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 71
LDI r1, 171
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 47
LDI r6, 240
LDI r7, 133
LDI r8, 254
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
