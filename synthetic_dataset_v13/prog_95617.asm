; DESCRIPTION: Composite: Renders a magenta disk with center (295, 159) and radius 58 then Draws a purple line from (117, 182) to (351, 244).
; PLAN: r0=295(x), r1=159(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=117(x1), r6=182(y1), r7=351(x2), r8=244(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 295
LDI r1, 159
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 117
LDI r6, 182
LDI r7, 351
LDI r8, 244
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
