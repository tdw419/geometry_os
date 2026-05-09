; DESCRIPTION: Composite: Renders a orange disk with center (132, 184) and radius 54 then Renders a blue line between points (308, 112) and (238, 120).
; PLAN: r0=132(x), r1=184(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=308(x1), r6=112(y1), r7=238(x2), r8=120(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 132
LDI r1, 184
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 308
LDI r6, 112
LDI r7, 238
LDI r8, 120
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
