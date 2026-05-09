; DESCRIPTION: Composite: Draws a white line from (97, 29) to (194, 128) then Creates a magenta circular shape at (173, 123) with radius 76.
; PLAN: r0=97(x1), r1=29(y1), r2=194(x2), r3=128(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=173(x), r6=123(y), r7=76(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 97
LDI r1, 29
LDI r2, 194
LDI r3, 128
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 173
LDI r6, 123
LDI r7, 76
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
