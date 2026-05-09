; DESCRIPTION: Composite: Places a purple circle of radius 60 at center (90, 112) then Draws a red line from (126, 167) to (318, 178).
; PLAN: r0=90(x), r1=112(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=126(x1), r6=167(y1), r7=318(x2), r8=178(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 90
LDI r1, 112
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 126
LDI r6, 167
LDI r7, 318
LDI r8, 178
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
