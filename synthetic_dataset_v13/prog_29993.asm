; DESCRIPTION: Composite: Places a yellow line segment connecting (247, 55) to (387, 9) then Creates a yellow circular shape at (397, 123) with radius 64.
; PLAN: r0=247(x1), r1=55(y1), r2=387(x2), r3=9(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=397(x), r6=123(y), r7=64(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 247
LDI r1, 55
LDI r2, 387
LDI r3, 9
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 397
LDI r6, 123
LDI r7, 64
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
