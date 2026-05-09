; DESCRIPTION: Composite: Places a orange line segment connecting (21, 112) to (142, 83) then Places a green circle of radius 44 at center (312, 184).
; PLAN: r0=21(x1), r1=112(y1), r2=142(x2), r3=83(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=312(x), r6=184(y), r7=44(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 21
LDI r1, 112
LDI r2, 142
LDI r3, 83
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 184
LDI r7, 44
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
