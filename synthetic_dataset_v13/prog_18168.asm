; DESCRIPTION: Composite: Places a magenta circle of radius 59 at center (312, 131) then Places a purple line segment connecting (101, 5) to (186, 189).
; PLAN: r0=312(x), r1=131(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=101(x1), r6=5(y1), r7=186(x2), r8=189(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 312
LDI r1, 131
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 101
LDI r6, 5
LDI r7, 186
LDI r8, 189
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
