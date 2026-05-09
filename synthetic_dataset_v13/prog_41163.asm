; DESCRIPTION: Composite: Renders a blue disk with center (171, 38) and radius 15 then Renders a black line between points (221, 102) and (502, 66).
; PLAN: r0=171(x), r1=38(y), r2=15(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=221(x1), r6=102(y1), r7=502(x2), r8=66(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 171
LDI r1, 38
LDI r2, 15
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 221
LDI r6, 102
LDI r7, 502
LDI r8, 66
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
