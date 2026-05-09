; DESCRIPTION: Composite: Places a magenta line segment connecting (415, 208) to (457, 36) then Places a black circle of radius 23 at center (438, 110).
; PLAN: r0=415(x1), r1=208(y1), r2=457(x2), r3=36(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=438(x), r6=110(y), r7=23(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 415
LDI r1, 208
LDI r2, 457
LDI r3, 36
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 438
LDI r6, 110
LDI r7, 23
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
