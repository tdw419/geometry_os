; DESCRIPTION: Composite: Renders a black disk with center (367, 190) and radius 58 then Draws a red line from (317, 189) to (157, 181).
; PLAN: r0=367(x), r1=190(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=317(x1), r6=189(y1), r7=157(x2), r8=181(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 367
LDI r1, 190
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 317
LDI r6, 189
LDI r7, 157
LDI r8, 181
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
