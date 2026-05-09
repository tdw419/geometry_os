; DESCRIPTION: Composite: Renders a white disk with center (141, 68) and radius 53 then Renders a red line between points (363, 28) and (212, 191).
; PLAN: r0=141(x), r1=68(y), r2=53(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=363(x1), r6=28(y1), r7=212(x2), r8=191(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 141
LDI r1, 68
LDI r2, 53
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 363
LDI r6, 28
LDI r7, 212
LDI r8, 191
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
