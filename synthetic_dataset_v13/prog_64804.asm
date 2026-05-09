; DESCRIPTION: Composite: Places a orange circle of radius 53 at center (441, 192) then Places a red line segment connecting (256, 153) to (102, 85).
; PLAN: r0=441(x), r1=192(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=256(x1), r6=153(y1), r7=102(x2), r8=85(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 441
LDI r1, 192
LDI r2, 53
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 256
LDI r6, 153
LDI r7, 102
LDI r8, 85
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
