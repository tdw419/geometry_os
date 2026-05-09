; DESCRIPTION: Composite: Renders a white disk with center (387, 172) and radius 20 then Renders a green line between points (475, 153) and (29, 147).
; PLAN: r0=387(x), r1=172(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=475(x1), r6=153(y1), r7=29(x2), r8=147(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 387
LDI r1, 172
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 475
LDI r6, 153
LDI r7, 29
LDI r8, 147
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
