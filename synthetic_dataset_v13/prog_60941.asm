; DESCRIPTION: Composite: Draws a white line from (503, 129) to (179, 249) then Creates a yellow circular shape at (211, 145) with radius 70.
; PLAN: r0=503(x1), r1=129(y1), r2=179(x2), r3=249(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=211(x), r6=145(y), r7=70(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 503
LDI r1, 129
LDI r2, 179
LDI r3, 249
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 145
LDI r7, 70
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
