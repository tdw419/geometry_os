; DESCRIPTION: Composite: Renders a magenta line between points (207, 165) and (355, 81) then Renders a magenta disk with center (341, 197) and radius 58.
; PLAN: r0=207(x1), r1=165(y1), r2=355(x2), r3=81(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=341(x), r6=197(y), r7=58(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 207
LDI r1, 165
LDI r2, 355
LDI r3, 81
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 341
LDI r6, 197
LDI r7, 58
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
