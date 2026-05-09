; DESCRIPTION: Composite: Places a blue line segment connecting (383, 58) to (179, 114) then Places a blue circle of radius 75 at center (414, 154).
; PLAN: r0=383(x1), r1=58(y1), r2=179(x2), r3=114(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=414(x), r6=154(y), r7=75(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 383
LDI r1, 58
LDI r2, 179
LDI r3, 114
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 414
LDI r6, 154
LDI r7, 75
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
