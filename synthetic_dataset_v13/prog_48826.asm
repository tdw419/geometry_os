; DESCRIPTION: Composite: Draws a green circle centered at (78, 45) with radius 37 then Renders a cyan line between points (29, 106) and (83, 8).
; PLAN: r0=78(x), r1=45(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=29(x1), r6=106(y1), r7=83(x2), r8=8(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 78
LDI r1, 45
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 29
LDI r6, 106
LDI r7, 83
LDI r8, 8
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
