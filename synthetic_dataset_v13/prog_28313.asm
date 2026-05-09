; DESCRIPTION: Composite: Renders a yellow line between points (500, 17) and (25, 215) then Renders a purple disk with center (318, 73) and radius 30.
; PLAN: r0=500(x1), r1=17(y1), r2=25(x2), r3=215(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=318(x), r6=73(y), r7=30(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 500
LDI r1, 17
LDI r2, 25
LDI r3, 215
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 318
LDI r6, 73
LDI r7, 30
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
