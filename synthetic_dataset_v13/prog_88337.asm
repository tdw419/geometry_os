; DESCRIPTION: Composite: Renders a yellow disk with center (108, 126) and radius 74 then Renders a green line between points (489, 253) and (324, 185).
; PLAN: r0=108(x), r1=126(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=489(x1), r6=253(y1), r7=324(x2), r8=185(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 108
LDI r1, 126
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 489
LDI r6, 253
LDI r7, 324
LDI r8, 185
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
