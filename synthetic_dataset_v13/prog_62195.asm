; DESCRIPTION: Composite: Places a magenta circle of radius 80 at center (109, 140) then Places a blue line segment connecting (148, 66) to (202, 149).
; PLAN: r0=109(x), r1=140(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=148(x1), r6=66(y1), r7=202(x2), r8=149(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 109
LDI r1, 140
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 148
LDI r6, 66
LDI r7, 202
LDI r8, 149
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
