; DESCRIPTION: Composite: Renders a magenta disk with center (458, 87) and radius 10 then Places a magenta line segment connecting (201, 114) to (342, 73).
; PLAN: r0=458(x), r1=87(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=201(x1), r6=114(y1), r7=342(x2), r8=73(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 458
LDI r1, 87
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 201
LDI r6, 114
LDI r7, 342
LDI r8, 73
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
