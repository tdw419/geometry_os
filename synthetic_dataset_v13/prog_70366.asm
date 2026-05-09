; DESCRIPTION: Composite: Creates a purple circular shape at (390, 159) with radius 71 then Renders a magenta line between points (391, 156) and (262, 200).
; PLAN: r0=390(x), r1=159(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=391(x1), r6=156(y1), r7=262(x2), r8=200(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 390
LDI r1, 159
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 391
LDI r6, 156
LDI r7, 262
LDI r8, 200
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
