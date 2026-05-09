; DESCRIPTION: Composite: Renders a red line between points (171, 36) and (244, 27) then Renders a white disk with center (400, 136) and radius 80.
; PLAN: r0=171(x1), r1=36(y1), r2=244(x2), r3=27(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=400(x), r6=136(y), r7=80(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 171
LDI r1, 36
LDI r2, 244
LDI r3, 27
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 136
LDI r7, 80
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
