; DESCRIPTION: Composite: Renders a red disk with center (68, 158) and radius 17 then Draws a black line from (403, 217) to (400, 8).
; PLAN: r0=68(x), r1=158(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=403(x1), r6=217(y1), r7=400(x2), r8=8(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 68
LDI r1, 158
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 403
LDI r6, 217
LDI r7, 400
LDI r8, 8
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
