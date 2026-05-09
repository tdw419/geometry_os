; DESCRIPTION: Composite: Renders a blue line between points (237, 119) and (125, 230) then Places a purple circle of radius 21 at center (169, 176).
; PLAN: r0=237(x1), r1=119(y1), r2=125(x2), r3=230(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=169(x), r6=176(y), r7=21(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 237
LDI r1, 119
LDI r2, 125
LDI r3, 230
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 169
LDI r6, 176
LDI r7, 21
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
