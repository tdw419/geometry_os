; DESCRIPTION: Composite: Renders a black line between points (142, 46) and (349, 237) then Renders a blue disk with center (308, 147) and radius 21.
; PLAN: r0=142(x1), r1=46(y1), r2=349(x2), r3=237(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=308(x), r6=147(y), r7=21(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 142
LDI r1, 46
LDI r2, 349
LDI r3, 237
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 308
LDI r6, 147
LDI r7, 21
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
