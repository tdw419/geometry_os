; DESCRIPTION: Composite: Renders a red line between points (480, 125) and (350, 169) then Renders a white disk with center (286, 157) and radius 60.
; PLAN: r0=480(x1), r1=125(y1), r2=350(x2), r3=169(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=286(x), r6=157(y), r7=60(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 480
LDI r1, 125
LDI r2, 350
LDI r3, 169
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 286
LDI r6, 157
LDI r7, 60
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
