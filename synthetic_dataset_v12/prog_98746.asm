; DESCRIPTION: Composite: Draws a white line from (373, 86) to (56, 69) then Creates a green circular shape at (288, 201) with radius 54.
; PLAN: r0=373(x1), r1=86(y1), r2=56(x2), r3=69(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=288(x), r6=201(y), r7=54(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 373
LDI r1, 86
LDI r2, 56
LDI r3, 69
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 288
LDI r6, 201
LDI r7, 54
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
