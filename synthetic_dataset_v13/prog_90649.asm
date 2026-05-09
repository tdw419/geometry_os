; DESCRIPTION: Composite: Creates a red circular shape at (103, 70) with radius 47 then Places a blue line segment connecting (455, 23) to (332, 147).
; PLAN: r0=103(x), r1=70(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=455(x1), r6=23(y1), r7=332(x2), r8=147(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 103
LDI r1, 70
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 455
LDI r6, 23
LDI r7, 332
LDI r8, 147
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
