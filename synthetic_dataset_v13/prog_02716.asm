; DESCRIPTION: Composite: Creates a purple circular shape at (359, 170) with radius 36 then Renders a yellow line between points (41, 59) and (38, 82).
; PLAN: r0=359(x), r1=170(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=41(x1), r6=59(y1), r7=38(x2), r8=82(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 359
LDI r1, 170
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 41
LDI r6, 59
LDI r7, 38
LDI r8, 82
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
