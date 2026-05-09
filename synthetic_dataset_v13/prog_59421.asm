; DESCRIPTION: Composite: Places a white circle of radius 49 at center (353, 176) then Places a orange line segment connecting (102, 227) to (183, 242).
; PLAN: r0=353(x), r1=176(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=102(x1), r6=227(y1), r7=183(x2), r8=242(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 353
LDI r1, 176
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 102
LDI r6, 227
LDI r7, 183
LDI r8, 242
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
