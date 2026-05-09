; DESCRIPTION: Composite: Creates a yellow circular shape at (179, 204) with radius 22 then Draws a blue line from (4, 134) to (75, 129).
; PLAN: r0=179(x), r1=204(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=4(x1), r6=134(y1), r7=75(x2), r8=129(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 179
LDI r1, 204
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 4
LDI r6, 134
LDI r7, 75
LDI r8, 129
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
