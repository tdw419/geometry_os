; DESCRIPTION: Composite: Renders a purple disk with center (266, 108) and radius 58 then Draws a red line from (109, 206) to (390, 63).
; PLAN: r0=266(x), r1=108(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=109(x1), r6=206(y1), r7=390(x2), r8=63(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 266
LDI r1, 108
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 109
LDI r6, 206
LDI r7, 390
LDI r8, 63
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
