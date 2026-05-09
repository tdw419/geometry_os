; DESCRIPTION: Composite: Draws a green line from (341, 251) to (274, 97) then Renders a green disk with center (80, 69) and radius 12.
; PLAN: r0=341(x1), r1=251(y1), r2=274(x2), r3=97(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=80(x), r6=69(y), r7=12(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 341
LDI r1, 251
LDI r2, 274
LDI r3, 97
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 80
LDI r6, 69
LDI r7, 12
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
