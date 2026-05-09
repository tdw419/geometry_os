; DESCRIPTION: Composite: Renders a yellow disk with center (322, 169) and radius 30 then Renders a blue line between points (228, 218) and (84, 172).
; PLAN: r0=322(x), r1=169(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=228(x1), r6=218(y1), r7=84(x2), r8=172(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 322
LDI r1, 169
LDI r2, 30
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 228
LDI r6, 218
LDI r7, 84
LDI r8, 172
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
