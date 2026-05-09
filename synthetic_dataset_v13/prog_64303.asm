; DESCRIPTION: Composite: Draws a blue circle centered at (139, 119) with radius 22 then Draws a white line from (253, 16) to (61, 189).
; PLAN: r0=139(x), r1=119(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=253(x1), r6=16(y1), r7=61(x2), r8=189(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 139
LDI r1, 119
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 253
LDI r6, 16
LDI r7, 61
LDI r8, 189
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
