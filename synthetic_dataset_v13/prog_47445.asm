; DESCRIPTION: Composite: Draws a cyan circle centered at (155, 115) with radius 20 then Renders a white line between points (464, 5) and (447, 2).
; PLAN: r0=155(x), r1=115(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=464(x1), r6=5(y1), r7=447(x2), r8=2(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 155
LDI r1, 115
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 464
LDI r6, 5
LDI r7, 447
LDI r8, 2
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
