; DESCRIPTION: Composite: Places a black circle of radius 65 at center (308, 112) then Renders a blue line between points (353, 217) and (460, 98).
; PLAN: r0=308(x), r1=112(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=353(x1), r6=217(y1), r7=460(x2), r8=98(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 308
LDI r1, 112
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 353
LDI r6, 217
LDI r7, 460
LDI r8, 98
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
