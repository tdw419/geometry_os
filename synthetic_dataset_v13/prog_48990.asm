; DESCRIPTION: Composite: Renders a white line between points (93, 131) and (288, 135) then Draws a green circle centered at (218, 134) with radius 52.
; PLAN: r0=93(x1), r1=131(y1), r2=288(x2), r3=135(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=218(x), r6=134(y), r7=52(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 93
LDI r1, 131
LDI r2, 288
LDI r3, 135
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 134
LDI r7, 52
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
