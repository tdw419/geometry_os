; DESCRIPTION: Composite: Places a yellow line segment connecting (148, 123) to (150, 69) then Renders a red disk with center (93, 100) and radius 80.
; PLAN: r0=148(x1), r1=123(y1), r2=150(x2), r3=69(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=93(x), r6=100(y), r7=80(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 148
LDI r1, 123
LDI r2, 150
LDI r3, 69
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 100
LDI r7, 80
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
