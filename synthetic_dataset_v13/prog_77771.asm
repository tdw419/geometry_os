; DESCRIPTION: Composite: Places a cyan line segment connecting (206, 184) to (157, 188) then Creates a green circular shape at (227, 153) with radius 35.
; PLAN: r0=206(x1), r1=184(y1), r2=157(x2), r3=188(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=227(x), r6=153(y), r7=35(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 206
LDI r1, 184
LDI r2, 157
LDI r3, 188
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 153
LDI r7, 35
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
