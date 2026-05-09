; DESCRIPTION: Composite: Renders a purple disk with center (166, 84) and radius 63 then Renders a purple line between points (417, 238) and (198, 6).
; PLAN: r0=166(x), r1=84(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=417(x1), r6=238(y1), r7=198(x2), r8=6(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 166
LDI r1, 84
LDI r2, 63
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 417
LDI r6, 238
LDI r7, 198
LDI r8, 6
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
