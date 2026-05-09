; DESCRIPTION: Composite: Places a green line segment connecting (407, 226) to (161, 30) then Creates a red circular shape at (204, 159) with radius 70.
; PLAN: r0=407(x1), r1=226(y1), r2=161(x2), r3=30(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=204(x), r6=159(y), r7=70(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 407
LDI r1, 226
LDI r2, 161
LDI r3, 30
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 159
LDI r7, 70
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
