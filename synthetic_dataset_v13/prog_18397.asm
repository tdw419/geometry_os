; DESCRIPTION: Composite: Renders a white line between points (420, 83) and (444, 124) then Creates a orange circular shape at (420, 101) with radius 55.
; PLAN: r0=420(x1), r1=83(y1), r2=444(x2), r3=124(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=420(x), r6=101(y), r7=55(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 420
LDI r1, 83
LDI r2, 444
LDI r3, 124
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 101
LDI r7, 55
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
