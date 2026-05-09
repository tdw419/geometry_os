; DESCRIPTION: Composite: Creates a blue circular shape at (286, 157) with radius 39 then Renders a yellow line between points (301, 122) and (339, 201).
; PLAN: r0=286(x), r1=157(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=301(x1), r6=122(y1), r7=339(x2), r8=201(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 286
LDI r1, 157
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 301
LDI r6, 122
LDI r7, 339
LDI r8, 201
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
