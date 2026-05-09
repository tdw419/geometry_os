; DESCRIPTION: Composite: Renders a black disk with center (358, 70) and radius 65 then Renders a green line between points (81, 81) and (249, 122).
; PLAN: r0=358(x), r1=70(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=81(x1), r6=81(y1), r7=249(x2), r8=122(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 358
LDI r1, 70
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 81
LDI r6, 81
LDI r7, 249
LDI r8, 122
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
