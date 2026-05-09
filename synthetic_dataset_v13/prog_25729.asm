; DESCRIPTION: Composite: Places a red circle of radius 33 at center (175, 165) then Places a red line segment connecting (253, 168) to (22, 76).
; PLAN: r0=175(x), r1=165(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=253(x1), r6=168(y1), r7=22(x2), r8=76(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 175
LDI r1, 165
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 253
LDI r6, 168
LDI r7, 22
LDI r8, 76
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
