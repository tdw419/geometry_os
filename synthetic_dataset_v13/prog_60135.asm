; DESCRIPTION: Composite: Creates a yellow circular shape at (397, 160) with radius 70 then Draws a black line from (430, 58) to (218, 153).
; PLAN: r0=397(x), r1=160(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=430(x1), r6=58(y1), r7=218(x2), r8=153(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 397
LDI r1, 160
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 430
LDI r6, 58
LDI r7, 218
LDI r8, 153
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
