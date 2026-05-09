; DESCRIPTION: Composite: Draws a green circle centered at (163, 115) with radius 31 then Renders a white line between points (208, 172) and (382, 168).
; PLAN: r0=163(x), r1=115(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=208(x1), r6=172(y1), r7=382(x2), r8=168(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 163
LDI r1, 115
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 208
LDI r6, 172
LDI r7, 382
LDI r8, 168
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
