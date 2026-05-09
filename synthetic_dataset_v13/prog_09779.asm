; DESCRIPTION: Composite: Places a purple circle of radius 71 at center (136, 162) then Places a blue line segment connecting (412, 36) to (99, 102).
; PLAN: r0=136(x), r1=162(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=412(x1), r6=36(y1), r7=99(x2), r8=102(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 136
LDI r1, 162
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 412
LDI r6, 36
LDI r7, 99
LDI r8, 102
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
