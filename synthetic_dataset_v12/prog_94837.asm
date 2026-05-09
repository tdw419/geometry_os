; DESCRIPTION: Composite: Renders a red line between points (97, 197) and (61, 165) then Renders a red disk with center (438, 44) and radius 15.
; PLAN: r0=97(x1), r1=197(y1), r2=61(x2), r3=165(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=438(x), r6=44(y), r7=15(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 97
LDI r1, 197
LDI r2, 61
LDI r3, 165
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 438
LDI r6, 44
LDI r7, 15
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
