; DESCRIPTION: Composite: Renders a red line between points (287, 139) and (34, 107) then Places a black circle of radius 25 at center (224, 223).
; PLAN: r0=287(x1), r1=139(y1), r2=34(x2), r3=107(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=224(x), r6=223(y), r7=25(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 287
LDI r1, 139
LDI r2, 34
LDI r3, 107
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 224
LDI r6, 223
LDI r7, 25
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
