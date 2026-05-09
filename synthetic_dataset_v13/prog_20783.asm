; DESCRIPTION: Composite: Renders a white line between points (267, 183) and (127, 131) then Places a purple circle of radius 25 at center (287, 88).
; PLAN: r0=267(x1), r1=183(y1), r2=127(x2), r3=131(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=287(x), r6=88(y), r7=25(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 267
LDI r1, 183
LDI r2, 127
LDI r3, 131
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 88
LDI r7, 25
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
