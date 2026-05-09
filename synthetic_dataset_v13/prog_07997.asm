; DESCRIPTION: Composite: Renders a black line between points (364, 91) and (355, 254) then Renders a red disk with center (61, 123) and radius 29.
; PLAN: r0=364(x1), r1=91(y1), r2=355(x2), r3=254(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=61(x), r6=123(y), r7=29(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 364
LDI r1, 91
LDI r2, 355
LDI r3, 254
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 61
LDI r6, 123
LDI r7, 29
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
