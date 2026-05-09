; DESCRIPTION: Composite: Renders a magenta disk with center (341, 94) and radius 25 then Places a blue line segment connecting (335, 122) to (246, 249).
; PLAN: r0=341(x), r1=94(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=335(x1), r6=122(y1), r7=246(x2), r8=249(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 341
LDI r1, 94
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 335
LDI r6, 122
LDI r7, 246
LDI r8, 249
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
