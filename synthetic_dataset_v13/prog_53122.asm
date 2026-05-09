; DESCRIPTION: Composite: Renders a red line between points (464, 220) and (62, 173) then Renders a red disk with center (299, 148) and radius 78.
; PLAN: r0=464(x1), r1=220(y1), r2=62(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=299(x), r6=148(y), r7=78(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 464
LDI r1, 220
LDI r2, 62
LDI r3, 173
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 148
LDI r7, 78
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
