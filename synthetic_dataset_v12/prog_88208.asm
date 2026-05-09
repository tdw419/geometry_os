; DESCRIPTION: Composite: Draws a white line from (147, 89) to (435, 121) then Renders a magenta disk with center (347, 151) and radius 20.
; PLAN: r0=147(x1), r1=89(y1), r2=435(x2), r3=121(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=347(x), r6=151(y), r7=20(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 147
LDI r1, 89
LDI r2, 435
LDI r3, 121
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 151
LDI r7, 20
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
