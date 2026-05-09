; DESCRIPTION: Composite: Renders a purple line between points (157, 202) and (122, 89) then Places a blue circle of radius 19 at center (67, 169).
; PLAN: r0=157(x1), r1=202(y1), r2=122(x2), r3=89(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=67(x), r6=169(y), r7=19(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 157
LDI r1, 202
LDI r2, 122
LDI r3, 89
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 67
LDI r6, 169
LDI r7, 19
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
