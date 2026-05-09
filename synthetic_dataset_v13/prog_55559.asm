; DESCRIPTION: Composite: Draws a white circle centered at (185, 71) with radius 24 then Renders a green line between points (289, 223) and (363, 237).
; PLAN: r0=185(x), r1=71(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=289(x1), r6=223(y1), r7=363(x2), r8=237(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 185
LDI r1, 71
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 289
LDI r6, 223
LDI r7, 363
LDI r8, 237
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
