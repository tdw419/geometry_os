; DESCRIPTION: Composite: Renders a black line between points (501, 77) and (184, 65) then Draws a yellow circle centered at (317, 79) with radius 60.
; PLAN: r0=501(x1), r1=77(y1), r2=184(x2), r3=65(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=317(x), r6=79(y), r7=60(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 501
LDI r1, 77
LDI r2, 184
LDI r3, 65
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 79
LDI r7, 60
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
