; DESCRIPTION: Composite: Renders a white disk with center (308, 176) and radius 78 then Draws a yellow line from (322, 192) to (219, 95).
; PLAN: r0=308(x), r1=176(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=322(x1), r6=192(y1), r7=219(x2), r8=95(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 308
LDI r1, 176
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 322
LDI r6, 192
LDI r7, 219
LDI r8, 95
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
