; DESCRIPTION: Composite: Creates a purple circular shape at (162, 152) with radius 49 then Places a yellow line segment connecting (423, 194) to (499, 60).
; PLAN: r0=162(x), r1=152(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=423(x1), r6=194(y1), r7=499(x2), r8=60(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 162
LDI r1, 152
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 423
LDI r6, 194
LDI r7, 499
LDI r8, 60
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
