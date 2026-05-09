; DESCRIPTION: Composite: Places a orange line segment connecting (221, 206) to (326, 157) then Creates a white circular shape at (312, 144) with radius 77.
; PLAN: r0=221(x1), r1=206(y1), r2=326(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=312(x), r6=144(y), r7=77(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 221
LDI r1, 206
LDI r2, 326
LDI r3, 157
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 144
LDI r7, 77
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
