; DESCRIPTION: Composite: Renders a magenta disk with center (478, 178) and radius 22 then Renders a black line between points (111, 178) and (140, 31).
; PLAN: r0=478(x), r1=178(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=111(x1), r6=178(y1), r7=140(x2), r8=31(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 478
LDI r1, 178
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 111
LDI r6, 178
LDI r7, 140
LDI r8, 31
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
