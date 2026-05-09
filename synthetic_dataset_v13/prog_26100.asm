; DESCRIPTION: Composite: Renders a black line between points (307, 113) and (311, 183) then Renders a red disk with center (266, 46) and radius 20.
; PLAN: r0=307(x1), r1=113(y1), r2=311(x2), r3=183(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=266(x), r6=46(y), r7=20(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 307
LDI r1, 113
LDI r2, 311
LDI r3, 183
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 46
LDI r7, 20
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
