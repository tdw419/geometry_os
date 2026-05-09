; DESCRIPTION: Composite: Places a red circle of radius 13 at center (364, 139) then Places a yellow line segment connecting (473, 232) to (90, 133).
; PLAN: r0=364(x), r1=139(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=473(x1), r6=232(y1), r7=90(x2), r8=133(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 364
LDI r1, 139
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 473
LDI r6, 232
LDI r7, 90
LDI r8, 133
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
