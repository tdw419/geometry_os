; DESCRIPTION: Composite: Renders a yellow line between points (483, 6) and (353, 252) then Draws a red circle centered at (403, 193) with radius 49.
; PLAN: r0=483(x1), r1=6(y1), r2=353(x2), r3=252(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=403(x), r6=193(y), r7=49(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 483
LDI r1, 6
LDI r2, 353
LDI r3, 252
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 403
LDI r6, 193
LDI r7, 49
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
